String dePluralise(String input) {
  if (input.substring(input.length - 1, input.length) == "s") {
    return input.substring(0, input.length - 1);
  }

  return input;
}
