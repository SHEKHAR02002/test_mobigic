void highlightTextInGrid(String searchWord, List<List<String>> matrix) {
  int m = matrix.length;
  int n = matrix[0].length;

  // Check left-to-right (east)
  for (int i = 0; i < m; i++) {
    for (int j = 0; j <= n - searchWord.length; j++) {
      bool found = true;
      for (int k = 0; k < searchWord.length; k++) {
        if (matrix[i][j + k] != searchWord[k]) {
          found = false;
          break;
        }
      }
      if (found) {
        highlight(i, j, i, j + searchWord.length - 1, matrix);
        return;
      }
    }
  }

  // Check top-to-bottom (south)
  for (int i = 0; i <= m - searchWord.length; i++) {
    for (int j = 0; j < n; j++) {
      bool found = true;
      for (int k = 0; k < searchWord.length; k++) {
        if (matrix[i + k][j] != searchWord[k]) {
          found = false;
          break;
        }
      }
      if (found) {
        highlight(i, j, i + searchWord.length - 1, j, matrix);
        return;
      }
    }
  }

  // Check diagonal (south-east)
  for (int i = 0; i <= m - searchWord.length; i++) {
    for (int j = 0; j <= n - searchWord.length; j++) {
      bool found = true;
      for (int k = 0; k < searchWord.length; k++) {
        if (matrix[i + k][j + k] != searchWord[k]) {
          found = false;
          break;
        }
      }
      if (found) {
        highlight(
            i, j, i + searchWord.length - 1, j + searchWord.length - 1, matrix);
        return;
      }
    }
  }

  print("Search word not found in any direction.");
}

void highlight(int startRow, int startCol, int endRow, int endCol,
    List<List<String>> matrix) {
  for (int i = startRow; i <= endRow; i++) {
    for (int j = startCol; j <= endCol; j++) {
      // You can customize the highlighting logic here.
      matrix[i][j] = matrix[i][j].toUpperCase();
    }
  }

  // Print the highlighted matrix
  for (int i = 0; i < matrix.length; i++) {
    print(matrix[i]);
  }
}
