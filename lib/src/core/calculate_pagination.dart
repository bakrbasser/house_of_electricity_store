int globalRange = 10;

fromRange(int page) => page * globalRange;

toRange(int page) => (page * globalRange) + 9;
