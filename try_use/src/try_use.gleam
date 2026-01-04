import gleam/io
import gleam/list

fn catify_without_use(strings: List(String)) -> List(String) {
  list.map(strings, fn(string) { string <> " cat" })
}

fn catify_with_use(strings: List(String)) -> List(String) {
  use string <- list.map(strings)
  string <> " cat"
}

pub fn main() {
  io.println("Hello from try_use!")
  let string_list = ["Joe", "Sam", "Archie"]
  list.each(catify_without_use(string_list), fn(catified_str) {
    io.println(catified_str)
  })

  use catified_str <- list.each(catify_with_use(string_list))
  io.println(catified_str)
  // io.debug(catify_without_use(string_list))
}
