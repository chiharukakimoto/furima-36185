window.addEventListener('load', () => {
  console.log("OK");
});

const priceInput = document.getElementById("item-price")
priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   console.log(inputValue);
   const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = priceInput.value * 0.1;
    const profitDom = document.getElementById("profit")
    profitDom.innerHTML = priceInput.value * 0.9;
});