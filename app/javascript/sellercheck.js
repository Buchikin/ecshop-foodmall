function check() {
  const pinkheart = document.querySelectorAll(".seller-pink-heart");
  pinkheart.forEach(function (heart) {
    if (heart.getAttribute("data-load") != null) {
      return null;
    }
    heart.setAttribute("data-load", "true");
    heart.addEventListener("click", () => {
      const heartId = heart.getAttribute("data-id");
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/seller/${heartId}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const favoriteseller = XHR.response.heart;
        if (favoriteseller.checked === true) {
          heart.removeAttribute("style", "filter: brightness(50%);");
        } else if (favoriteseller.checked === false) {
          heart.setAttribute("style", "filter: brightness(50%);");
        }
      };
    });
  });
}
setInterval(check, 1000);