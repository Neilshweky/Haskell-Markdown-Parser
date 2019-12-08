function renderHTML() {
    const text = document.getElementById('text').value
    const data = new URLSearchParams();
    data.append('md', text)
    fetch('http://localhost:3000/parse', {
      method: 'POST',
      body: data,
    }).then(res => res.text()).then(data => {
      document.getElementById('html').innerHTML = data
      console.log(data)
    })
}
console.log("HEREEE")

document.getElementById('text').addEventListener('input', renderHTML);

export { renderHTML }
  