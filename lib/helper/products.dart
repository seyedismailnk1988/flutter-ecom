class Product {
  final String name;
  final String category;
  final String imgURL;
  Product({
    required this.name,
    required this.category,
    required this.imgURL,
  });
}

final List<Product> productList = [
  Product(
      name: 'Sandwich',
      category: 'Food',
      imgURL:
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
  Product(
      name: 'Fish',
      category: 'Food',
      imgURL:
          'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?q=80&w=1473&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  Product(
      name: 'Vegetables',
      category: 'Food',
      imgURL:
          'https://images.unsplash.com/photo-1518843875459-f738682238a6?q=80&w=1442&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  Product(
      name: 'Apple',
      category: 'Fruits',
      imgURL:
          'https://images.unsplash.com/photo-1570913149827-d2ac84ab3f9a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8QXBwbGV8ZW58MHx8MHx8fDA%3D'),
  Product(
      name: 'Mango',
      category: 'Fruits',
      imgURL:
          'https://images.unsplash.com/photo-1605027990121-cbae9e0642df?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bWFuZ298ZW58MHx8MHx8fDA%3D'),
  Product(
      name: 'Banana',
      category: 'Fruits',
      imgURL:
          'https://images.unsplash.com/photo-1603833665858-e61d17a86224?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8QmFuYW5hfGVufDB8fDB8fHww'),
  Product(
      name: 'Cricket',
      category: 'Sports',
      imgURL:
          'https://images.unsplash.com/photo-1512719994953-eabf50895df7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Q3JpY2tldHxlbnwwfHwwfHx8MA%3D%3D'),
  Product(
      name: 'Football',
      category: 'Sports',
      imgURL:
          'https://images.unsplash.com/photo-1553778263-73a83bab9b0c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fEZvb3RiYWxsfGVufDB8fDB8fHww'),
  Product(
      name: 'Tennis',
      category: 'Sports',
      imgURL:
          'https://images.unsplash.com/flagged/photo-1576972405668-2d020a01cbfa?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fFRlbm5pc3xlbnwwfHwwfHx8MA%3D%3D'),
  Product(
      name: 'Civic',
      category: 'Vehicle',
      imgURL:
          'https://images.unsplash.com/photo-1519641471654-76ce0107ad1b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Q2l2aWMlMjBjYXJ8ZW58MHx8MHx8fDA%3D'),
  Product(
      name: 'Tesla',
      category: 'Vehicle',
      imgURL:
          'https://images.unsplash.com/photo-1572191267783-5618f992aff5?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fFRlc2xhfGVufDB8fDB8fHww'),
  Product(
      name: 'BMW',
      category: 'Vehicle',
      imgURL:
          'https://images.unsplash.com/photo-1617531653332-bd46c24f2068?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fEJNV3xlbnwwfHwwfHx8MA%3D%3D'),
  Product(
      name: 'Sandwich',
      category: 'Food',
      imgURL:
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
  Product(
      name: 'Fish',
      category: 'Food',
      imgURL:
          'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?q=80&w=1473&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  Product(
      name: 'Vegetables',
      category: 'Food',
      imgURL:
          'https://images.unsplash.com/photo-1518843875459-f738682238a6?q=80&w=1442&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  Product(
      name: 'Apple',
      category: 'Fruits',
      imgURL:
          'https://images.unsplash.com/photo-1570913149827-d2ac84ab3f9a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8QXBwbGV8ZW58MHx8MHx8fDA%3D'),
  Product(
      name: 'Mango',
      category: 'Fruits',
      imgURL:
          'https://images.unsplash.com/photo-1605027990121-cbae9e0642df?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bWFuZ298ZW58MHx8MHx8fDA%3D'),
  Product(
      name: 'Banana',
      category: 'Fruits',
      imgURL:
          'https://images.unsplash.com/photo-1603833665858-e61d17a86224?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8QmFuYW5hfGVufDB8fDB8fHww'),
  Product(
      name: 'Cricket',
      category: 'Sports',
      imgURL:
          'https://images.unsplash.com/photo-1512719994953-eabf50895df7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Q3JpY2tldHxlbnwwfHwwfHx8MA%3D%3D'),
  Product(
      name: 'Football',
      category: 'Sports',
      imgURL:
          'https://images.unsplash.com/photo-1553778263-73a83bab9b0c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fEZvb3RiYWxsfGVufDB8fDB8fHww'),
  Product(
      name: 'Tennis',
      category: 'Sports',
      imgURL:
          'https://images.unsplash.com/flagged/photo-1576972405668-2d020a01cbfa?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fFRlbm5pc3xlbnwwfHwwfHx8MA%3D%3D'),
  Product(
      name: 'Civic',
      category: 'Vehicle',
      imgURL:
          'https://images.unsplash.com/photo-1519641471654-76ce0107ad1b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Q2l2aWMlMjBjYXJ8ZW58MHx8MHx8fDA%3D'),
  Product(
      name: 'Tesla',
      category: 'Vehicle',
      imgURL:
          'https://images.unsplash.com/photo-1572191267783-5618f992aff5?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fFRlc2xhfGVufDB8fDB8fHww'),
  Product(
      name: 'BMW',
      category: 'Vehicle',
      imgURL:
          'https://images.unsplash.com/photo-1617531653332-bd46c24f2068?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fEJNV3xlbnwwfHwwfHx8MA%3D%3D')
];
