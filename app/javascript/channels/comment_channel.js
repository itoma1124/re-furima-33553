import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const nickname = document.getElementById('user-nickname')
    const html = `<p>${nickname}:${data.content.text}</p>`;
    console.log(html);
    const comments = document.getElementById('comment-list');
    console.log(comments);
    const newComment = document.getElementById('comment_text');
    console.log(newComment);
    comments.insertAdjacentHTML('afterbegin', html);
    // newComment.value='';
  }
});
