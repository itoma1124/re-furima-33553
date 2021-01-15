const { formDisableSelector } = require("@rails/ujs");

const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault(); 
    // e.preventDefault();で通常のRuby on Railsにおけるフォーム送信処理はキャンセルされています。
    // したがって、現状では「購入」ボタンをクリックしても、サーバーサイドへリクエストは送られません。
    
    //フォームの情報を取得するための記述
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {      
      number: formData.get("order_address[number]"),
      cvc: formData.get("order_address[cvc]"),
      exp_month: formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`,
    };
    // カードの情報をトークン化
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        // console.log(token)
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");

        document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);