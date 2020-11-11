# nanoid

A tiny, secure, URL-friendly, unique string ID generator for Lua,
ported from JavaScript.

## Installation

```bash
luarocks install nanoid
```

## Usage

The main module uses URL-friendly symbols (A-Za-z0-9_-) and returns
an ID with 21 characters (to have a collision probability similar to UUID v4).

```lua
local nanoid = require('nanoid')

local id = nanoid()
```

If you want to reduce the ID size (and increase collisions probability),
you can pass the size as an argument.

```lua
local id = nanoid(10)
```

### Security

By default, Nano ID uses hardware random bytes generation for security and
low collision probability. If you are not so concerned with security and more
concerned with performance, you can use the faster non-secure generator.

```lua
local nanoid = require('nanoid.non_secure')

local id = nanoid(10)
```

### Custom Alphabet or Size

`custom_alphabet` allows you to create `nanoid` with your own alphabet and ID
size.

```lua
local custom_alphabet = require('nanoid').custom_alphabet

local id = custom_alphabet('1234567890abcdef', 10)
```

`nanoid.non_secure` also contains this function.

## License

```text
MIT License

Copyright (c) 2020 Martín Aguilar

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
