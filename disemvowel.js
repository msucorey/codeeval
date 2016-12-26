function disemvowel(str) {
  var output = "";
  for (var n = 0;n < str.length; n++) {
    if (!"aeiou".includes(str.charAt(n))) {
      output += str.charAt(n);
    }
  }
  return output;
}
