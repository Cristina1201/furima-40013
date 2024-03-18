window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    profitDom.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
  });
});