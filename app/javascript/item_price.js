const pay = () => {
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const fee = Math.floor(inputValue * 0.1);  // 手数料を計算
    const profit = inputValue - fee;  // 利益を計算

    const feeOutput = document.getElementById('add-tax-price');
    const profitOutput = document.getElementById('profit');

    feeOutput.innerText = fee;  // 手数料を表示
    profitOutput.innerText = profit;  // 利益を表示
  })
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);