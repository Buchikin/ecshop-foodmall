const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-pay");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById('charge-pay');
    const formData = new FormData(formResult);


    const card = {
      number: formData.get("charge[number]"),
      cvc: formData.get("charge[cvc]"),
      exp_month: formData.get("charge[exp_month]"),
      exp_year: `20${formData.get("charge[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-pay");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-pay").submit();
    });
  });
};

window.addEventListener("load", pay);