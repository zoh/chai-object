# This is may be defined in bootstrap spec )
chai = require 'chai'
obj = require '..'
chai.use obj

chai.should()

describe 'Chai Object check include', ->
  Object.freeze statistics1 =
    max_drawdown: 50
    avarage_odds: 2
    rate: 25
    all_count: 100
    res:
      sdfsd: [123, 123, 123]
      arr: 123

  Object.freeze statistics2 =
    max_drawdown: 50
    avarage_odds: 2
    rate: 25
    all_count: 100
    res:
      sdfsd: [123, 123, 123]
      arr: 123

  it 'simple object', ->
    obj = test: 1
    obj.should.includeObj obj
    ({test: 1}).should.includeObj({test: 1})
    obj.should.includeObj test: 1

  it 'complex object', ->
    statistics1.should.includeObj statistics2
    statistics1.should.includeObj statistics1
    statistics1.should.includeObj  max_drawdown: 50, avarage_odds: 2, rate: 25, all_count: 100
    ( ->
      statistics1.should.includeObj  max_drawdown: 50, avarage_odds: 2, rate: 25, all_count: 100, res: sdfsd: [1, 123, 123]
    ).should.throw(chai.AssertionError)

  ###
  This [1, 123, 555] exist and 123, and 555
###
  it 'include in array object', ->
    [1, 123, 555].should.includeObj [123, 555]
    ( ->
      [1, [123, 123]].should.includeObj [[123, 123]]
    ).should.throw(chai.AssertionError)

