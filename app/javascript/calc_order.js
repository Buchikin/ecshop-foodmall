function calc_order (){
  const quantity = document.getElementById("order-quantity");
  const price = document.getElementById("one-price");
  const orderprice = document.getElementById("order-price");
  const nowcharge = document.getElementById("now-charge");
  const aftercharge = document.getElementById("after-charge");

  function calc (){
    const calcprice = Math.floor(Number(price.textContent) * Number(quantity.value));
    orderprice.innerHTML = `${calcprice}`;
    const calccharge = Math.floor(Number(nowcharge.textContent) - calcprice);
    if (calccharge <= 0) {
      aftercharge.innerHTML = `チャージしてください`;
      aftercharge.setAttribute("style", "font-size: 12pt;")
    } else {
      aftercharge.innerHTML = `${calccharge}`;
      aftercharge.removeAttribute("style", "font-size: 12pt;")
    }
  };

  calc() ;

  quantity.addEventListener("keyup", () => {
    if (Number.isInteger(Number(quantity.value))){
      calc();
    } else {
      orderprice.innerHTML = "半角整数で入力";
    }
  });
}

window.addEventListener('load', calc_order);