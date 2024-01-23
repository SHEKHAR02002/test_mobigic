List<List<String>> convertintolist(String input, int m, int n) {
  List<List<String>> matrix =
      List.generate(m, (i) => List<String>.filled(n, ""));

  if (input.length != m * n) {
    return [];
  }

  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      matrix[i][j] = input[i * n + j];
    }
  }

  return matrix;
}

