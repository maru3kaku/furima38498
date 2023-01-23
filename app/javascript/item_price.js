// 金額を入力した数値をpriceInputという変数に格納する

window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");//販売手数料 (10%)
    const addTax = inputValue
    addTaxDom.innerHTML = Math.floor(addTax * 0.1);
    const profit = document.getElementById("profit");//販売利益
    profit.innerHTML = addTax - addTaxDom.innerHTML;
  })
});