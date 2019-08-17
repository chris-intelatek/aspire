  var form_being_submitted = false; // global variable

  function checkForm(form)
  {
    if(form.firstname.value == "") {
      alert("Please enter your first and last names");
      form.firstname.focus();
      return false;
    }
    if(form.lastname.value == "") {
      alert("Please enter your first and last names");
      form.lastname.focus();
      return false;
    }
    return true;
  }

  function resetForm(form)
  {
    form.myButton.disabled = false;
    form.myButton.value = "Submit";
    form_being_submitted = false;
  }