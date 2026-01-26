context qmacro {
  entity Books {
    key ID    : Integer;
        title : String;
  }
}

service Bookshop {
  entity Books as projection on qmacro.Books;
}
