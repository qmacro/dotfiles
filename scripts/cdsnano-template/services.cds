context qmacro {
  entity Books {
    key ID    : Integer;
        title : String;
        stock : Integer;
  }
}

service Bookshop {
  entity Books as projection on qmacro.Books;
}
