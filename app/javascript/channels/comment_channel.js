import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const current_user = gon.current_user
    const item_user = gon.item_user


    if (current_user == item_user) {
      const html = `<p class="list-right">${data.content.text}：${current_user}(出品者)</p>`;
      const comments = document.getElementById('comment-list');
      const newComment = document.getElementById('comment_text');
      comments.insertAdjacentHTML('afterbegin', html);
      newComment.value='';
    } else {
      const html = `<p class="list-left">${current_user}：${data.content.text}</p>`;
      const comments = document.getElementById('comment-list');
      const newComment = document.getElementById('comment_text');
      comments.insertAdjacentHTML('afterbegin', html);
      newComment.value='';
    }
  }
});
