# TDD Connect Four Game

This is a Ruby implementation of the classic Connect Four game. The game was developed with a focus on studying Test-Driven Development (TDD) using RSpec for testing. The resource and assigment is based on the Ruby Course in The Odin Project.

## Game Description

Connect Four is a two-player connection game in which the players take turns dropping colored discs from the top into a seven-column, six-row vertically suspended grid. The objective of the game is to be the first to form a horizontal, vertical, or diagonal line of four of one's own discs.

## Features

- Dynamic board size: The default board is 6 rows by 7 columns, but you can customize the size.
- Two-player mode: Player 1 uses "X" and Player 2 uses "O".
- Check for wins in horizontal, vertical, and both diagonal directions.
- Detects full columns and board to declare a draw if no moves are possible.

## Usage

To play the game, run the following command:

```sh
ruby lib/connect_four.rb
```

Follow the on-screen prompts to play the game.

## Installation

1. Clone the repository:

    ```sh
    git clone https://github.com/yourusername/connect_four.git
    cd connect_four
    ```

2. Ensure you have Ruby installed. If not, download and install it from [ruby-lang.org](https://www.ruby-lang.org/en/downloads/).

3. Install the required gems:

    ```sh
    bundle install
    ```

## TDD and RSpec

This project was developed with Test-Driven Development (TDD) in mind. The game logic is thoroughly tested using RSpec. You can find the tests in the `spec` folder.

To run the tests, use the following command:

```sh
rspec
```

### Example RSpec Tests

The following are some of the test cases covered:

- Displaying the board with column numbers.
- Placing pieces on the board.
- Checking for a full board.
- Detecting a winner in horizontal, vertical, and diagonal directions.

## Contributing

If you wish to contribute to the project, please fork the repository and submit a pull request. Make sure your changes are well-tested.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

This project was created for educational purposes, focusing on learning and applying Test-Driven Development (TDD) using Ruby and RSpec.
