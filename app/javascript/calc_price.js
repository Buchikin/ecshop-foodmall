function calc_price (){
  const price = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  function calc (){
    const tax = Math.floor(price.value * 0.05);
    const gain = Number(price.value) - tax;
    taxPrice.innerHTML = `${tax}`;
    profit.innerHTML = `${gain}`;
  };

  calc() ;

  price.addEventListener("keyup", () => {
    if (Number.isInteger(Number(price.value))){
      calc();
    } else {
      taxPrice.innerHTML = "半角整数で入力";
      profit.innerHTML = "半角整数で入力";
    }
  });
}

window.addEventListener('load', calc_price);