window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const tax_price = document.getElementById("add-tax-price");
    const addTaxDom = document.getElementById("profit");
    const value_result = inputValue * 0.1
    tax_price.innerHTML = (Math.floor(value_result));
    addTaxDom.innerHTML = (Math.floor(inputValue - value_result));
  })
});