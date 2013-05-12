
module.exports = function(chai, _) {
    // CoffeeScript Compiled :)
    var Assertion = chai.Assertion
        , i = _.inspect;

    var __include;

    __include = function(object, sub_object) {
        var key, val;

        if (object instanceof Array) {
            for (key in sub_object) {
                if (object.indexOf(sub_object[key]) === -1) {
                    return false;
                }
            }
        } else
            for (key in sub_object) {
                val = sub_object[key];
                if (!((sub_object != null ? sub_object[key] : void 0) && _.eql(val, object[key]) )) {
                    return false;
                }
            }
        return true;
    };

    /**
     * Assert includeObj
     */
    function include(val) {
        var obj = _.flag(this, 'object');
//        console.log(_.eql({lol: 123}, {lol: 123}));

        this.assert(
            __include(obj, val),
            'expected #{this} to include sub object ' + _.inspect(val),
            'expected #{this} to not include sub object ' + _.inspect(val)
        );
    };

    Assertion.addChainableMethod('includeObj', include);
};