const { formDisableSelector } = require("@rails/ujs");

const pay = () => {
  Payjp.setPublicKey(pk_test_d86c66634ec37c015c30e0cd); // PAY.JPテスト公開鍵
  const form = document.getElementById("credit-card-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault(); 
    // e.preventDefault();で通常のRuby on Railsにおけるフォーム送信処理はキャンセルされています。
    // したがって、現状では「購入」ボタンをクリックしても、サーバーサイドへリクエストは送られません。

    //フォームの情報を取得するための記述
    const formResult = document.getElementById("credit-card-form");
    const formData = new FormData(formResult);

    const card = {      
      number: formData.getElementById("card-number"),
      cvc: formData.getElementById("card-cvc"),
      exp_month: formData.getElementById("card-exp-month"),
      exp_year: `20${formData.getElementById("card-exp-month")}`,
    };
    // カードの情報をトークン化
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);