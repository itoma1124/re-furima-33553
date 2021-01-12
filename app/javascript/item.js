window.addEventListener('load', function (){

  const inputPrice = document.getElementById("item-price")
  const taxPrice = document.getElementById("add-tax-price")
  const profitPrice = document.getElementById("profit")

  inputPrice.addEventListener('input', function(){
    const inputValue = inputPrice.value
    taxPrice.innerHTML = Math.trunc(inputValue * 0.1)
    profitPrice.innerHTML = inputValue - Math.trunc(inputValue * 0.1)
  })
})
