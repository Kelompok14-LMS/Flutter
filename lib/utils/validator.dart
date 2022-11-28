mixin Validator {
  String? validateForm(value) {
    if (value.isEmpty || value == '') {
      return '*Wajib diisi !';
    }
    return null;
  }
}
