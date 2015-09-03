require 'spec_helper'

describe Conway::Board do
  describe 'cell_at' do
    it 'finds the cell at the given coordinates' do
      board = Conway::Board.new([
        [1, 0, 0],
        [0, 0, 0],
        [0, 0, 1]
      ])

      cell = board.cell_at(0, 0)
      expect(cell).to be_alive

      cell = board.cell_at(2, 2)
      expect(cell).to be_alive

      expect(board.cell_at(-1, 0)).to be_nil
      expect(board.cell_at(0, -1)).to be_nil
      expect(board.cell_at(3, 0)).to be_nil
      expect(board.cell_at(0, 3)).to be_nil
    end

    it 'works when the board is not square' do
      board = Conway::Board.parse('0000')
      expect(board.cell_at(0, 3)).to be_nil
    end
  end

  describe 'to_s' do
    it 'prints the ASCII board' do
      board = Conway::Board.new([
        [1, 1, 1],
        [0, 0, 0],
        [0, 0, 0]
      ])

      expect(board.to_s).to eq("1 1 1\n0 0 0\n0 0 0")
    end
  end

  describe 'to_a' do
    it 'returns the original array grid' do
      board = Conway::Board.new( [
        [1, 0, 0],
        [0, 0, 0],
        [0, 0, 0]
      ])

      expect(board.to_a).to eq([
        [1, 0, 0],
        [0, 0, 0],
        [0, 0, 0]
      ])
    end
  end
end
