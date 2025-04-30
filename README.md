# 💤 LazyVim x NvChad

## CheatSheet

| File Manager  | key          |
| ------------- | ------------ |
| open / toggle | `<C-n>`      |
| focus         | `<leader>e`  |
| collapse      | `<leader>ec` |
| refresh       | `<leader>er` |

| INSERT MODE          | key                 |
| -------------------- | ------------------- |
| **Deleting Action**  | **Key Combination** |
| Delete one character | `<C-h>`             |
| Delete one word      | `<C-w>`             |
| Delete entire line   | `<C-u>`             |

| UI                    | key          |
| --------------------- | ------------ |
| toggle format on save | `<leader>uf` |
| toggle word wrap      | `<leader>uw` |

| Enter INSERT MODE                       | Key | Shift Modifier                                              |
| --------------------------------------- | --- | ----------------------------------------------------------- |
| After the current cursor position       | `a` | Moves the cursor to the end of the current line (`A`)       |
| At the current cursor position          | `i` | Moves the cursor to the beginning of the current line (`I`) |
| Opens a new line below the current line | `o` | Opens a new line above the current line (`O`)               |

| Scrolling Action               | Key Combination |
| ------------------------------ | --------------- |
| **Scrolling by Lines**         |                 |
| Scroll down by one line        | `<C-e>`         |
| Scroll up by one line          | `<C-y>`         |
| **Scrolling by Half a Screen** |                 |
| Scroll down by half a screen   | `<C-d>`         |
| Scroll up by half a screen     | `<C-u>`         |
| **Scrolling by Full Screen**   |                 |
| Scroll down by a full screen   | `<C-f>`         |
| Scroll up by a full screen     | `<C-b>`         |

| Terminal             | Key Combination |
| -------------------- | --------------- |
| escape terminal mode | `<C-x>`         |

---

The easiest way I have found to do this is by marking each file you want to move with `m`. This puts a bookmark onto your file. From anywhere perform `bmv` and you can type the location to move your file(s) to.The current directory will be conveniently prefixed before you start typing. This key combo makes for efficient use with bulk moves and single files.

:%s/string_to_replace/new_string/g

---

Type this command in Neovim to display recent messages:

```
:messages
```

👉 This will show you any errors, warnings or information Neovim has displayed recently.
