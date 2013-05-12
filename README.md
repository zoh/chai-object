# chai-object

An extension to the [chai](http://chaijs.com/) assertion library (VERSION: 1.6.0)
that provides a set of include object assertions.

## Installation

```bash
$ npm install chai-object
```

```coffeescriot
chai = require('chai')
chai.should()
object = require('chai-object')
chai.use object
```

### includeObj
```javascript
({test: 1}).should.includeObj({test: 1})
```


....

## Test

```bash
$ npm test
```

## License
MIT
