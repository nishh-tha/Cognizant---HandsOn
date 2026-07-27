function BookDetails() {
  const books = [
    {
      id: 1,
      name: "React in Action",
      price: "₹650",
    },
    {
      id: 2,
      name: "Learning React",
      price: "₹720",
    },
    {
      id: 3,
      name: "JavaScript: The Good Parts",
      price: "₹550",
    },
  ];

  return (
    <div>
      <h2>Book Details</h2>

      {books.map((book) => (
        <div key={book.id}>
          <h4>{book.name}</h4>
          <p>{book.price}</p>
        </div>
      ))}
    </div>
  );
}

export default BookDetails;