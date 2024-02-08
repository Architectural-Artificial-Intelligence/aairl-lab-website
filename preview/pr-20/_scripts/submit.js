

window.addEventListener("DOMContentLoaded", () => {

    const handleSubmit = async (event) => {
        event.preventDefault();
        const form = event.target
      
      const status = form.appendChild(document.createElement("div"));
      const data = new FormData(form);
      fetch(form.action, {
        method: form.method,
        body: data,
        headers: {
            'Accept': 'application/json'
        }
      }).then(response => {
        if (response.ok) {
          status.innerHTML = "Thanks for your submission!";
          form.reset()
        } else {
          response.json().then(data => {
            if (Object.hasOwn(data, 'errors')) {
              status.innerHTML = data["errors"].map(error => error["message"]).join(", ")
            } else {
              status.innerHTML = "Oops! There was a problem submitting your form"
            }
          })
        }
      }).catch(error => {
        status.innerHTML = "Oops! There was a problem submitting your form"
      });
    }
    const forms = document.getElementsByTagName("form")

    for (let form of forms) {
        form.addEventListener("submit", handleSubmit)
    }
});
