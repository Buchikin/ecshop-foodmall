function calc_charge (){
  const charge = document.getElementById("input-charge");
  const nowcharge = document.getElementById("now-charge");
  const newcharge = document.getElementById("new-charge");

  function calc (){
    const newpay = Math.floor(Number(nowcharge.textContent) + Number(charge.value));
    newcharge.innerHTML = `${newpay}`;
  };

  calc() ;

  charge.addEventListener("keyup", () => {
    if (Number.isInteger(Number(charge.value))){
      calc();
    } else {
      newcharge.innerHTML = "半角整数で入力";
    }
  });
}

window.addEventListener('load', calc_charge);