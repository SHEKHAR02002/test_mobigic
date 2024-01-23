List<List<String>> findtext({
  required List<List<String>> grid,
  required String text,
}) {
  void highlightfindText(List<List<String>> grid, String text) {
    print(grid);
    int rows = grid.length;
    int cols = grid[0].length;

    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < cols; col++) {
        if (col + text.length <= cols) {
          String temp = '';
          for (int i = 0; i < text.length; i++) {
            temp += grid[row][col + i];
          }
          if (temp == text) {
            for (int i = 0; i < text.length; i++) {
              grid[row][col + i] = '${grid[row][col + i]}.';
            }
          }
        }

        // Check for top to bottom (south) direction
        if (row + text.length <= rows) {
          String temp = '';
          for (int i = 0; i < text.length; i++) {
            temp += grid[row + i][col];
          }
          if (temp == text) {
            for (int i = 0; i < text.length; i++) {
              grid[row + i][col] =
                  '${grid[row + i][col]}.'; // Highlight with '*'
            }
          }
        }

        // Check for diagonal (south-east) direction
        if (row + text.length <= rows && col + text.length <= cols) {
          String temp = '';
          for (int i = 0; i < text.length; i++) {
            temp += grid[row + i][col + i];
          }
          if (temp == text) {
            for (int i = 0; i < text.length; i++) {
              grid[row + i][col + i] =
                  '${grid[row + i][col + i]}.'; // Highlight with '*'
            }
          }
        }
      }
    }
  }

  highlightfindText(grid, text);
  List<List<String>> finalresult = [];

  for (int row = 0; row < grid.length; row++) {
    finalresult.add(grid[row]);
  }

  return finalresult;
}
