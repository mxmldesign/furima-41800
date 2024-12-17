const price = () => {
  const priceInput = document.getElementById("item-price")
  const feeDisplay = document.getElementById("add-tax-price")
  const profitDisplay = document.getElementById("profit")
  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const price = priceInput.value
      if (price) {
        const fee = Math.floor(price * 0.1); // 手数料は10%
        const profit = price - fee;         // 利益を計算
            
        feeDisplay.textContent = fee.toLocaleString();
        profitDisplay.textContent = profit.toLocaleString();
      } else {
        feeDisplay.textContent = "0";
        profitDisplay.textContent = "0";
      }
    })
  }
}

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);