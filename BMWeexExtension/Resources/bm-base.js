// { "framework": "Vue" }

/******/
(function(modules) { // webpackBootstrap
    /******/ // The module cache
    /******/
    var installedModules = {};
    /******/
    /******/ // The require function
    /******/
    function __webpack_require__(moduleId) {
        /******/
        /******/ // Check if module is in cache
        /******/
        if (installedModules[moduleId]) {
            /******/
            return installedModules[moduleId].exports;
            /******/
        }
        /******/ // Create a new module (and put it into the cache)
        /******/
        var module = installedModules[moduleId] = {
            /******/
            i: moduleId,
            /******/
            l: false,
            /******/
            exports: {}
            /******/
        };
        /******/
        /******/ // Execute the module function
        /******/
        modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
        /******/
        /******/ // Flag the module as loaded
        /******/
        module.l = true;
        /******/
        /******/ // Return the exports of the module
        /******/
        return module.exports;
        /******/
    }
    /******/
    /******/
    /******/ // expose the modules object (__webpack_modules__)
    /******/
    __webpack_require__.m = modules;
    /******/
    /******/ // expose the module cache
    /******/
    __webpack_require__.c = installedModules;
    /******/
    /******/ // define getter function for harmony exports
    /******/
    __webpack_require__.d = function(exports, name, getter) {
        /******/
        if (!__webpack_require__.o(exports, name)) {
            /******/
            Object.defineProperty(exports, name, {
                /******/
                configurable: false,
                /******/
                enumerable: true,
                /******/
                get: getter
                    /******/
            });
            /******/
        }
        /******/
    };
    /******/
    /******/ // getDefaultExport function for compatibility with non-harmony modules
    /******/
    __webpack_require__.n = function(module) {
        /******/
        var getter = module && module.__esModule ?
            /******/
            function getDefault() { return module['default']; } :
            /******/
            function getModuleExports() { return module; };
        /******/
        __webpack_require__.d(getter, 'a', getter);
        /******/
        return getter;
        /******/
    };
    /******/
    /******/ // Object.prototype.hasOwnProperty.call
    /******/
    __webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
    /******/
    /******/ // __webpack_public_path__
    /******/
    __webpack_require__.p = "/Users/yangmingzhe/Work/opensource/weex-eros/fe/dist/js/";
    /******/
    /******/ // Load entry module and return exports
    /******/
    return __webpack_require__(__webpack_require__.s = 246);
    /******/
})
/************************************************************************/
/******/
([
    /* 0 */
    /***/
    (function(module, exports) {

        // https://github.com/zloirock/core-js/issues/86#issuecomment-115759028
        var global = module.exports = typeof window != 'undefined' && window.Math == Math ?
            window : typeof self != 'undefined' && self.Math == Math ? self
            // eslint-disable-next-line no-new-func
            :
            Function('return this')();
        if (typeof __g == 'number') __g = global; // eslint-disable-line no-undef


        /***/
    }),
    /* 1 */
    /***/
    (function(module, exports) {

        var core = module.exports = { version: '2.5.1' };
        if (typeof __e == 'number') __e = core; // eslint-disable-line no-undef


        /***/
    }),
    /* 2 */
    /***/
    (function(module, exports, __webpack_require__) {

        // Thank's IE8 for his funny defineProperty
        module.exports = !__webpack_require__(6)(function() {
            return Object.defineProperty({}, 'a', { get: function() { return 7; } }).a != 7;
        });


        /***/
    }),
    /* 3 */
    /***/
    (function(module, exports, __webpack_require__) {

        var anObject = __webpack_require__(11);
        var IE8_DOM_DEFINE = __webpack_require__(30);
        var toPrimitive = __webpack_require__(22);
        var dP = Object.defineProperty;

        exports.f = __webpack_require__(2) ? Object.defineProperty : function defineProperty(O, P, Attributes) {
            anObject(O);
            P = toPrimitive(P, true);
            anObject(Attributes);
            if (IE8_DOM_DEFINE) try {
                return dP(O, P, Attributes);
            } catch (e) { /* empty */ }
            if ('get' in Attributes || 'set' in Attributes) throw TypeError('Accessors not supported!');
            if ('value' in Attributes) O[P] = Attributes.value;
            return O;
        };


        /***/
    }),
    /* 4 */
    /***/
    (function(module, exports, __webpack_require__) {

        var store = __webpack_require__(19)('wks');
        var uid = __webpack_require__(16);
        var Symbol = __webpack_require__(0).Symbol;
        var USE_SYMBOL = typeof Symbol == 'function';

        var $exports = module.exports = function(name) {
            return store[name] || (store[name] =
                USE_SYMBOL && Symbol[name] || (USE_SYMBOL ? Symbol : uid)('Symbol.' + name));
        };

        $exports.store = store;


        /***/
    }),
    /* 5 */
    /***/
    (function(module, exports) {

        var hasOwnProperty = {}.hasOwnProperty;
        module.exports = function(it, key) {
            return hasOwnProperty.call(it, key);
        };


        /***/
    }),
    /* 6 */
    /***/
    (function(module, exports) {

        module.exports = function(exec) {
            try {
                return !!exec();
            } catch (e) {
                return true;
            }
        };


        /***/
    }),
    /* 7 */
    /***/
    (function(module, exports, __webpack_require__) {

        var dP = __webpack_require__(3);
        var createDesc = __webpack_require__(12);
        module.exports = __webpack_require__(2) ? function(object, key, value) {
            return dP.f(object, key, createDesc(1, value));
        } : function(object, key, value) {
            object[key] = value;
            return object;
        };


        /***/
    }),
    /* 8 */
    /***/
    (function(module, exports, __webpack_require__) {

        // to indexed object, toObject with fallback for non-array-like ES3 strings
        var IObject = __webpack_require__(24);
        var defined = __webpack_require__(15);
        module.exports = function(it) {
            return IObject(defined(it));
        };


        /***/
    }),
    /* 9 */
    /***/
    (function(module, exports) {

        module.exports = function(it) {
            return typeof it === 'object' ? it !== null : typeof it === 'function';
        };


        /***/
    }),
    /* 10 */
    /***/
    (function(module, exports, __webpack_require__) {

        var global = __webpack_require__(0);
        var core = __webpack_require__(1);
        var ctx = __webpack_require__(29);
        var hide = __webpack_require__(7);
        var PROTOTYPE = 'prototype';

        var $export = function(type, name, source) {
            var IS_FORCED = type & $export.F;
            var IS_GLOBAL = type & $export.G;
            var IS_STATIC = type & $export.S;
            var IS_PROTO = type & $export.P;
            var IS_BIND = type & $export.B;
            var IS_WRAP = type & $export.W;
            var exports = IS_GLOBAL ? core : core[name] || (core[name] = {});
            var expProto = exports[PROTOTYPE];
            var target = IS_GLOBAL ? global : IS_STATIC ? global[name] : (global[name] || {})[PROTOTYPE];
            var key, own, out;
            if (IS_GLOBAL) source = name;
            for (key in source) {
                // contains in native
                own = !IS_FORCED && target && target[key] !== undefined;
                if (own && key in exports) continue;
                // export native or passed
                out = own ? target[key] : source[key];
                // prevent global pollution for namespaces
                exports[key] = IS_GLOBAL && typeof target[key] != 'function' ? source[key]
                    // bind timers to global for call from export context
                    :
                    IS_BIND && own ? ctx(out, global)
                    // wrap global constructors for prevent change them in library
                    :
                    IS_WRAP && target[key] == out ? (function(C) {
                        var F = function(a, b, c) {
                            if (this instanceof C) {
                                switch (arguments.length) {
                                    case 0:
                                        return new C();
                                    case 1:
                                        return new C(a);
                                    case 2:
                                        return new C(a, b);
                                }
                                return new C(a, b, c);
                            }
                            return C.apply(this, arguments);
                        };
                        F[PROTOTYPE] = C[PROTOTYPE];
                        return F;
                        // make static versions for prototype methods
                    })(out) : IS_PROTO && typeof out == 'function' ? ctx(Function.call, out) : out;
                // export proto methods to core.%CONSTRUCTOR%.methods.%NAME%
                if (IS_PROTO) {
                    (exports.virtual || (exports.virtual = {}))[key] = out;
                    // export proto methods to core.%CONSTRUCTOR%.prototype.%NAME%
                    if (type & $export.R && expProto && !expProto[key]) hide(expProto, key, out);
                }
            }
        };
        // type bitmap
        $export.F = 1; // forced
        $export.G = 2; // global
        $export.S = 4; // static
        $export.P = 8; // proto
        $export.B = 16; // bind
        $export.W = 32; // wrap
        $export.U = 64; // safe
        $export.R = 128; // real proto method for `library`
        module.exports = $export;


        /***/
    }),
    /* 11 */
    /***/
    (function(module, exports, __webpack_require__) {

        var isObject = __webpack_require__(9);
        module.exports = function(it) {
            if (!isObject(it)) throw TypeError(it + ' is not an object!');
            return it;
        };


        /***/
    }),
    /* 12 */
    /***/
    (function(module, exports) {

        module.exports = function(bitmap, value) {
            return {
                enumerable: !(bitmap & 1),
                configurable: !(bitmap & 2),
                writable: !(bitmap & 4),
                value: value
            };
        };


        /***/
    }),
    /* 13 */
    /***/
    (function(module, exports, __webpack_require__) {

        // 19.1.2.14 / 15.2.3.14 Object.keys(O)
        var $keys = __webpack_require__(31);
        var enumBugKeys = __webpack_require__(20);

        module.exports = Object.keys || function keys(O) {
            return $keys(O, enumBugKeys);
        };


        /***/
    }),
    /* 14 */
    /***/
    (function(module, exports) {

        // 7.1.4 ToInteger
        var ceil = Math.ceil;
        var floor = Math.floor;
        module.exports = function(it) {
            return isNaN(it = +it) ? 0 : (it > 0 ? floor : ceil)(it);
        };


        /***/
    }),
    /* 15 */
    /***/
    (function(module, exports) {

        // 7.2.1 RequireObjectCoercible(argument)
        module.exports = function(it) {
            if (it == undefined) throw TypeError("Can't call method on  " + it);
            return it;
        };


        /***/
    }),
    /* 16 */
    /***/
    (function(module, exports) {

        var id = 0;
        var px = Math.random();
        module.exports = function(key) {
            return 'Symbol('.concat(key === undefined ? '' : key, ')_', (++id + px).toString(36));
        };


        /***/
    }),
    /* 17 */
    ,
    /* 18 */
    /***/
    (function(module, exports, __webpack_require__) {

        var shared = __webpack_require__(19)('keys');
        var uid = __webpack_require__(16);
        module.exports = function(key) {
            return shared[key] || (shared[key] = uid(key));
        };


        /***/
    }),
    /* 19 */
    /***/
    (function(module, exports, __webpack_require__) {

        var global = __webpack_require__(0);
        var SHARED = '__core-js_shared__';
        var store = global[SHARED] || (global[SHARED] = {});
        module.exports = function(key) {
            return store[key] || (store[key] = {});
        };


        /***/
    }),
    /* 20 */
    /***/
    (function(module, exports) {

        // IE 8- don't enum bug keys
        module.exports = (
            'constructor,hasOwnProperty,isPrototypeOf,propertyIsEnumerable,toLocaleString,toString,valueOf'
        ).split(',');


        /***/
    }),
    /* 21 */
    ,
    /* 22 */
    /***/
    (function(module, exports, __webpack_require__) {

        // 7.1.1 ToPrimitive(input [, PreferredType])
        var isObject = __webpack_require__(9);
        // instead of the ES6 spec version, we didn't implement @@toPrimitive case
        // and the second argument - flag - preferred type is a string
        module.exports = function(it, S) {
            if (!isObject(it)) return it;
            var fn, val;
            if (S && typeof(fn = it.toString) == 'function' && !isObject(val = fn.call(it))) return val;
            if (typeof(fn = it.valueOf) == 'function' && !isObject(val = fn.call(it))) return val;
            if (!S && typeof(fn = it.toString) == 'function' && !isObject(val = fn.call(it))) return val;
            throw TypeError("Can't convert object to primitive value");
        };


        /***/
    }),
    /* 23 */
    /***/
    (function(module, exports) {

        var toString = {}.toString;

        module.exports = function(it) {
            return toString.call(it).slice(8, -1);
        };


        /***/
    }),
    /* 24 */
    /***/
    (function(module, exports, __webpack_require__) {

        // fallback for non-array-like ES3 and non-enumerable old V8 strings
        var cof = __webpack_require__(23);
        // eslint-disable-next-line no-prototype-builtins
        module.exports = Object('z').propertyIsEnumerable(0) ? Object : function(it) {
            return cof(it) == 'String' ? it.split('') : Object(it);
        };


        /***/
    }),
    /* 25 */
    /***/
    (function(module, exports) {

        module.exports = {};


        /***/
    }),
    /* 26 */
    /***/
    (function(module, exports, __webpack_require__) {

        // 7.1.13 ToObject(argument)
        var defined = __webpack_require__(15);
        module.exports = function(it) {
            return Object(defined(it));
        };


        /***/
    }),
    /* 27 */
    ,
    /* 28 */
    /***/
    (function(module, exports, __webpack_require__) {

        var isObject = __webpack_require__(9);
        var document = __webpack_require__(0).document;
        // typeof document.createElement is 'object' in old IE
        var is = isObject(document) && isObject(document.createElement);
        module.exports = function(it) {
            return is ? document.createElement(it) : {};
        };


        /***/
    }),
    /* 29 */
    /***/
    (function(module, exports, __webpack_require__) {

        // optional / simple context binding
        var aFunction = __webpack_require__(35);
        module.exports = function(fn, that, length) {
            aFunction(fn);
            if (that === undefined) return fn;
            switch (length) {
                case 1:
                    return function(a) {
                        return fn.call(that, a);
                    };
                case 2:
                    return function(a, b) {
                        return fn.call(that, a, b);
                    };
                case 3:
                    return function(a, b, c) {
                        return fn.call(that, a, b, c);
                    };
            }
            return function( /* ...args */ ) {
                return fn.apply(that, arguments);
            };
        };


        /***/
    }),
    /* 30 */
    /***/
    (function(module, exports, __webpack_require__) {

        module.exports = !__webpack_require__(2) && !__webpack_require__(6)(function() {
            return Object.defineProperty(__webpack_require__(28)('div'), 'a', { get: function() { return 7; } }).a != 7;
        });


        /***/
    }),
    /* 31 */
    /***/
    (function(module, exports, __webpack_require__) {

        var has = __webpack_require__(5);
        var toIObject = __webpack_require__(8);
        var arrayIndexOf = __webpack_require__(38)(false);
        var IE_PROTO = __webpack_require__(18)('IE_PROTO');

        module.exports = function(object, names) {
            var O = toIObject(object);
            var i = 0;
            var result = [];
            var key;
            for (key in O)
                if (key != IE_PROTO) has(O, key) && result.push(key);
                // Don't enum bug & hidden keys
            while (names.length > i)
                if (has(O, key = names[i++])) {
                    ~arrayIndexOf(result, key) || result.push(key);
                }
            return result;
        };


        /***/
    }),
    /* 32 */
    /***/
    (function(module, exports, __webpack_require__) {

        var def = __webpack_require__(3).f;
        var has = __webpack_require__(5);
        var TAG = __webpack_require__(4)('toStringTag');

        module.exports = function(it, tag, stat) {
            if (it && !has(it = stat ? it : it.prototype, TAG)) def(it, TAG, { configurable: true, value: tag });
        };


        /***/
    }),
    /* 33 */
    ,
    /* 34 */
    /***/
    (function(module, exports) {

        module.exports = true;


        /***/
    }),
    /* 35 */
    /***/
    (function(module, exports) {

        module.exports = function(it) {
            if (typeof it != 'function') throw TypeError(it + ' is not a function!');
            return it;
        };


        /***/
    }),
    /* 36 */
    ,
    /* 37 */
    /***/
    (function(module, exports, __webpack_require__) {

        // 7.1.15 ToLength
        var toInteger = __webpack_require__(14);
        var min = Math.min;
        module.exports = function(it) {
            return it > 0 ? min(toInteger(it), 0x1fffffffffffff) : 0; // pow(2, 53) - 1 == 9007199254740991
        };


        /***/
    }),
    /* 38 */
    /***/
    (function(module, exports, __webpack_require__) {

        // false -> Array#indexOf
        // true  -> Array#includes
        var toIObject = __webpack_require__(8);
        var toLength = __webpack_require__(37);
        var toAbsoluteIndex = __webpack_require__(39);
        module.exports = function(IS_INCLUDES) {
            return function($this, el, fromIndex) {
                var O = toIObject($this);
                var length = toLength(O.length);
                var index = toAbsoluteIndex(fromIndex, length);
                var value;
                // Array#includes uses SameValueZero equality algorithm
                // eslint-disable-next-line no-self-compare
                if (IS_INCLUDES && el != el)
                    while (length > index) {
                        value = O[index++];
                        // eslint-disable-next-line no-self-compare
                        if (value != value) return true;
                        // Array#indexOf ignores holes, Array#includes - not
                    } else
                        for (; length > index; index++)
                            if (IS_INCLUDES || index in O) {
                                if (O[index] === el) return IS_INCLUDES || index || 0;
                            }
                return !IS_INCLUDES && -1;
            };
        };


        /***/
    }),
    /* 39 */
    /***/
    (function(module, exports, __webpack_require__) {

        var toInteger = __webpack_require__(14);
        var max = Math.max;
        var min = Math.min;
        module.exports = function(index, length) {
            index = toInteger(index);
            return index < 0 ? max(index + length, 0) : min(index, length);
        };


        /***/
    }),
    /* 40 */
    ,
    /* 41 */
    ,
    /* 42 */
    /***/
    (function(module, exports, __webpack_require__) {

        // 19.1.2.2 / 15.2.3.5 Object.create(O [, Properties])
        var anObject = __webpack_require__(11);
        var dPs = __webpack_require__(60);
        var enumBugKeys = __webpack_require__(20);
        var IE_PROTO = __webpack_require__(18)('IE_PROTO');
        var Empty = function() { /* empty */ };
        var PROTOTYPE = 'prototype';

        // Create object with fake `null` prototype: use iframe Object with cleared prototype
        var createDict = function() {
            // Thrash, waste and sodomy: IE GC bug
            var iframe = __webpack_require__(28)('iframe');
            var i = enumBugKeys.length;
            var lt = '<';
            var gt = '>';
            var iframeDocument;
            iframe.style.display = 'none';
            __webpack_require__(55).appendChild(iframe);
            iframe.src = 'javascript:'; // eslint-disable-line no-script-url
            // createDict = iframe.contentWindow.Object;
            // html.removeChild(iframe);
            iframeDocument = iframe.contentWindow.document;
            iframeDocument.open();
            iframeDocument.write(lt + 'script' + gt + 'document.F=Object' + lt + '/script' + gt);
            iframeDocument.close();
            createDict = iframeDocument.F;
            while (i--) delete createDict[PROTOTYPE][enumBugKeys[i]];
            return createDict();
        };

        module.exports = Object.create || function create(O, Properties) {
            var result;
            if (O !== null) {
                Empty[PROTOTYPE] = anObject(O);
                result = new Empty();
                Empty[PROTOTYPE] = null;
                // add "__proto__" for Object.getPrototypeOf polyfill
                result[IE_PROTO] = O;
            } else result = createDict();
            return Properties === undefined ? result : dPs(result, Properties);
        };


        /***/
    }),
    /* 43 */
    ,
    /* 44 */
    ,
    /* 45 */
    ,
    /* 46 */
    /***/
    (function(module, exports, __webpack_require__) {

        "use strict";

        var LIBRARY = __webpack_require__(34);
        var $export = __webpack_require__(10);
        var redefine = __webpack_require__(47);
        var hide = __webpack_require__(7);
        var has = __webpack_require__(5);
        var Iterators = __webpack_require__(25);
        var $iterCreate = __webpack_require__(59);
        var setToStringTag = __webpack_require__(32);
        var getPrototypeOf = __webpack_require__(61);
        var ITERATOR = __webpack_require__(4)('iterator');
        var BUGGY = !([].keys && 'next' in [].keys()); // Safari has buggy iterators w/o `next`
        var FF_ITERATOR = '@@iterator';
        var KEYS = 'keys';
        var VALUES = 'values';

        var returnThis = function() { return this; };

        module.exports = function(Base, NAME, Constructor, next, DEFAULT, IS_SET, FORCED) {
            $iterCreate(Constructor, NAME, next);
            var getMethod = function(kind) {
                if (!BUGGY && kind in proto) return proto[kind];
                switch (kind) {
                    case KEYS:
                        return function keys() { return new Constructor(this, kind); };
                    case VALUES:
                        return function values() { return new Constructor(this, kind); };
                }
                return function entries() { return new Constructor(this, kind); };
            };
            var TAG = NAME + ' Iterator';
            var DEF_VALUES = DEFAULT == VALUES;
            var VALUES_BUG = false;
            var proto = Base.prototype;
            var $native = proto[ITERATOR] || proto[FF_ITERATOR] || DEFAULT && proto[DEFAULT];
            var $default = $native || getMethod(DEFAULT);
            var $entries = DEFAULT ? !DEF_VALUES ? $default : getMethod('entries') : undefined;
            var $anyNative = NAME == 'Array' ? proto.entries || $native : $native;
            var methods, key, IteratorPrototype;
            // Fix native
            if ($anyNative) {
                IteratorPrototype = getPrototypeOf($anyNative.call(new Base()));
                if (IteratorPrototype !== Object.prototype && IteratorPrototype.next) {
                    // Set @@toStringTag to native iterators
                    setToStringTag(IteratorPrototype, TAG, true);
                    // fix for some old engines
                    if (!LIBRARY && !has(IteratorPrototype, ITERATOR)) hide(IteratorPrototype, ITERATOR, returnThis);
                }
            }
            // fix Array#{values, @@iterator}.name in V8 / FF
            if (DEF_VALUES && $native && $native.name !== VALUES) {
                VALUES_BUG = true;
                $default = function values() { return $native.call(this); };
            }
            // Define iterator
            if ((!LIBRARY || FORCED) && (BUGGY || VALUES_BUG || !proto[ITERATOR])) {
                hide(proto, ITERATOR, $default);
            }
            // Plug for library
            Iterators[NAME] = $default;
            Iterators[TAG] = returnThis;
            if (DEFAULT) {
                methods = {
                    values: DEF_VALUES ? $default : getMethod(VALUES),
                    keys: IS_SET ? $default : getMethod(KEYS),
                    entries: $entries
                };
                if (FORCED)
                    for (key in methods) {
                        if (!(key in proto)) redefine(proto, key, methods[key]);
                    } else $export($export.P + $export.F * (BUGGY || VALUES_BUG), NAME, methods);
            }
            return methods;
        };


        /***/
    }),
    /* 47 */
    /***/
    (function(module, exports, __webpack_require__) {

        module.exports = __webpack_require__(7);


        /***/
    }),
    /* 48 */
    ,
    /* 49 */
    /***/
    (function(module, exports, __webpack_require__) {

        module.exports = { "default": __webpack_require__(258), __esModule: true };

        /***/
    }),
    /* 50 */
    /***/
    (function(module, exports, __webpack_require__) {

        var baseGetTag = __webpack_require__(98),
            isObject = __webpack_require__(202);

        /** `Object#toString` result references. */
        var asyncTag = '[object AsyncFunction]',
            funcTag = '[object Function]',
            genTag = '[object GeneratorFunction]',
            proxyTag = '[object Proxy]';

        /**
         * Checks if `value` is classified as a `Function` object.
         *
         * @static
         * @memberOf _
         * @since 0.1.0
         * @category Lang
         * @param {*} value The value to check.
         * @returns {boolean} Returns `true` if `value` is a function, else `false`.
         * @example
         *
         * _.isFunction(_);
         * // => true
         *
         * _.isFunction(/abc/);
         * // => false
         */
        function isFunction(value) {
            if (!isObject(value)) {
                return false;
            }
            // The use of `Object#toString` avoids issues with the `typeof` operator
            // in Safari 9 which returns 'object' for typed arrays and other constructors.
            var tag = baseGetTag(value);
            return tag == funcTag || tag == genTag || tag == asyncTag || tag == proxyTag;
        }

        module.exports = isFunction;


        /***/
    }),
    /* 51 */
    /***/
    (function(module, exports, __webpack_require__) {

        module.exports = { "default": __webpack_require__(80), __esModule: true };

        /***/
    }),
    /* 52 */
    ,
    /* 53 */
    /***/
    (function(module, exports, __webpack_require__) {

        module.exports = { "default": __webpack_require__(248), __esModule: true };

        /***/
    }),
    /* 54 */
    /***/
    (function(module, exports, __webpack_require__) {

        "use strict";

        var $at = __webpack_require__(58)(true);

        // 21.1.3.27 String.prototype[@@iterator]()
        __webpack_require__(46)(String, 'String', function(iterated) {
            this._t = String(iterated); // target
            this._i = 0; // next index
            // 21.1.5.2.1 %StringIteratorPrototype%.next()
        }, function() {
            var O = this._t;
            var index = this._i;
            var point;
            if (index >= O.length) return { value: undefined, done: true };
            point = $at(O, index);
            this._i += point.length;
            return { value: point, done: false };
        });


        /***/
    }),
    /* 55 */
    /***/
    (function(module, exports, __webpack_require__) {

        var document = __webpack_require__(0).document;
        module.exports = document && document.documentElement;


        /***/
    }),
    /* 56 */
    ,
    /* 57 */
    ,
    /* 58 */
    /***/
    (function(module, exports, __webpack_require__) {

        var toInteger = __webpack_require__(14);
        var defined = __webpack_require__(15);
        // true  -> String#at
        // false -> String#codePointAt
        module.exports = function(TO_STRING) {
            return function(that, pos) {
                var s = String(defined(that));
                var i = toInteger(pos);
                var l = s.length;
                var a, b;
                if (i < 0 || i >= l) return TO_STRING ? '' : undefined;
                a = s.charCodeAt(i);
                return a < 0xd800 || a > 0xdbff || i + 1 === l || (b = s.charCodeAt(i + 1)) < 0xdc00 || b > 0xdfff ?
                    TO_STRING ? s.charAt(i) : a :
                    TO_STRING ? s.slice(i, i + 2) : (a - 0xd800 << 10) + (b - 0xdc00) + 0x10000;
            };
        };


        /***/
    }),
    /* 59 */
    /***/
    (function(module, exports, __webpack_require__) {

        "use strict";

        var create = __webpack_require__(42);
        var descriptor = __webpack_require__(12);
        var setToStringTag = __webpack_require__(32);
        var IteratorPrototype = {};

        // 25.1.2.1.1 %IteratorPrototype%[@@iterator]()
        __webpack_require__(7)(IteratorPrototype, __webpack_require__(4)('iterator'), function() { return this; });

        module.exports = function(Constructor, NAME, next) {
            Constructor.prototype = create(IteratorPrototype, { next: descriptor(1, next) });
            setToStringTag(Constructor, NAME + ' Iterator');
        };


        /***/
    }),
    /* 60 */
    /***/
    (function(module, exports, __webpack_require__) {

        var dP = __webpack_require__(3);
        var anObject = __webpack_require__(11);
        var getKeys = __webpack_require__(13);

        module.exports = __webpack_require__(2) ? Object.defineProperties : function defineProperties(O, Properties) {
            anObject(O);
            var keys = getKeys(Properties);
            var length = keys.length;
            var i = 0;
            var P;
            while (length > i) dP.f(O, P = keys[i++], Properties[P]);
            return O;
        };


        /***/
    }),
    /* 61 */
    /***/
    (function(module, exports, __webpack_require__) {

        // 19.1.2.9 / 15.2.3.2 Object.getPrototypeOf(O)
        var has = __webpack_require__(5);
        var toObject = __webpack_require__(26);
        var IE_PROTO = __webpack_require__(18)('IE_PROTO');
        var ObjectProto = Object.prototype;

        module.exports = Object.getPrototypeOf || function(O) {
            O = toObject(O);
            if (has(O, IE_PROTO)) return O[IE_PROTO];
            if (typeof O.constructor == 'function' && O instanceof O.constructor) {
                return O.constructor.prototype;
            }
            return O instanceof Object ? ObjectProto : null;
        };


        /***/
    }),
    /* 62 */
    /***/
    (function(module, exports) {



        /***/
    }),
    /* 63 */
    /***/
    (function(module, exports, __webpack_require__) {

        __webpack_require__(66);
        var global = __webpack_require__(0);
        var hide = __webpack_require__(7);
        var Iterators = __webpack_require__(25);
        var TO_STRING_TAG = __webpack_require__(4)('toStringTag');

        var DOMIterables = ('CSSRuleList,CSSStyleDeclaration,CSSValueList,ClientRectList,DOMRectList,DOMStringList,' +
            'DOMTokenList,DataTransferItemList,FileList,HTMLAllCollection,HTMLCollection,HTMLFormElement,HTMLSelectElement,' +
            'MediaList,MimeTypeArray,NamedNodeMap,NodeList,PaintRequestList,Plugin,PluginArray,SVGLengthList,SVGNumberList,' +
            'SVGPathSegList,SVGPointList,SVGStringList,SVGTransformList,SourceBufferList,StyleSheetList,TextTrackCueList,' +
            'TextTrackList,TouchList').split(',');

        for (var i = 0; i < DOMIterables.length; i++) {
            var NAME = DOMIterables[i];
            var Collection = global[NAME];
            var proto = Collection && Collection.prototype;
            if (proto && !proto[TO_STRING_TAG]) hide(proto, TO_STRING_TAG, NAME);
            Iterators[NAME] = Iterators.Array;
        }


        /***/
    }),
    /* 64 */
    /***/
    (function(module, exports) {

        var g;

        // This works in non-strict mode
        g = (function() {
            return this;
        })();

        try {
            // This works if eval is allowed (see CSP)
            g = g || Function("return this")() || (1, eval)("this");
        } catch (e) {
            // This works if the window reference is available
            if (typeof window === "object")
                g = window;
        }

        // g can still be undefined, but nothing to do about it...
        // We return undefined, instead of nothing here, so it's
        // easier to handle this case. if(!global) { ...}

        module.exports = g;


        /***/
    }),
    /* 65 */
    /***/
    (function(module, exports) {

        module.exports = function(module) {
            if (!module.webpackPolyfill) {
                module.deprecate = function() {};
                module.paths = [];
                // module.parent = undefined by default
                if (!module.children) module.children = [];
                Object.defineProperty(module, "loaded", {
                    enumerable: true,
                    get: function() {
                        return module.l;
                    }
                });
                Object.defineProperty(module, "id", {
                    enumerable: true,
                    get: function() {
                        return module.i;
                    }
                });
                module.webpackPolyfill = 1;
            }
            return module;
        };


        /***/
    }),
    /* 66 */
    /***/
    (function(module, exports, __webpack_require__) {

        "use strict";

        var addToUnscopables = __webpack_require__(67);
        var step = __webpack_require__(68);
        var Iterators = __webpack_require__(25);
        var toIObject = __webpack_require__(8);

        // 22.1.3.4 Array.prototype.entries()
        // 22.1.3.13 Array.prototype.keys()
        // 22.1.3.29 Array.prototype.values()
        // 22.1.3.30 Array.prototype[@@iterator]()
        module.exports = __webpack_require__(46)(Array, 'Array', function(iterated, kind) {
            this._t = toIObject(iterated); // target
            this._i = 0; // next index
            this._k = kind; // kind
            // 22.1.5.2.1 %ArrayIteratorPrototype%.next()
        }, function() {
            var O = this._t;
            var kind = this._k;
            var index = this._i++;
            if (!O || index >= O.length) {
                this._t = undefined;
                return step(1);
            }
            if (kind == 'keys') return step(0, index);
            if (kind == 'values') return step(0, O[index]);
            return step(0, [index, O[index]]);
        }, 'values');

        // argumentsList[@@iterator] is %ArrayProto_values% (9.4.4.6, 9.4.4.7)
        Iterators.Arguments = Iterators.Array;

        addToUnscopables('keys');
        addToUnscopables('values');
        addToUnscopables('entries');


        /***/
    }),
    /* 67 */
    /***/
    (function(module, exports) {

        module.exports = function() { /* empty */ };


        /***/
    }),
    /* 68 */
    /***/
    (function(module, exports) {

        module.exports = function(done, value) {
            return { value: value, done: !!done };
        };


        /***/
    }),
    /* 69 */
    /***/
    (function(module, exports, __webpack_require__) {

        var freeGlobal = __webpack_require__(230);

        /** Detect free variable `self`. */
        var freeSelf = typeof self == 'object' && self && self.Object === Object && self;

        /** Used as a reference to the global object. */
        var root = freeGlobal || freeSelf || Function('return this')();

        module.exports = root;


        /***/
    }),
    /* 70 */
    /***/
    (function(module, exports) {

        /**
         * Checks if `value` is classified as an `Array` object.
         *
         * @static
         * @memberOf _
         * @since 0.1.0
         * @category Lang
         * @param {*} value The value to check.
         * @returns {boolean} Returns `true` if `value` is an array, else `false`.
         * @example
         *
         * _.isArray([1, 2, 3]);
         * // => true
         *
         * _.isArray(document.body.children);
         * // => false
         *
         * _.isArray('abc');
         * // => false
         *
         * _.isArray(_.noop);
         * // => false
         */
        var isArray = Array.isArray;

        module.exports = isArray;


        /***/
    }),
    /* 71 */
    ,
    /* 72 */
    ,
    /* 73 */
    ,
    /* 74 */
    ,
    /* 75 */
    ,
    /* 76 */
    ,
    /* 77 */
    ,
    /* 78 */
    ,
    /* 79 */
    ,
    /* 80 */
    /***/
    (function(module, exports, __webpack_require__) {

        var core = __webpack_require__(1);
        var $JSON = core.JSON || (core.JSON = { stringify: JSON.stringify });
        module.exports = function stringify(it) { // eslint-disable-line no-unused-vars
            return $JSON.stringify.apply($JSON, arguments);
        };


        /***/
    }),
    /* 81 */
    /***/
    (function(module, exports, __webpack_require__) {

        var baseIsNative = __webpack_require__(267),
            getValue = __webpack_require__(270);

        /**
         * Gets the native function at `key` of `object`.
         *
         * @private
         * @param {Object} object The object to query.
         * @param {string} key The key of the method to get.
         * @returns {*} Returns the function if it's native, else `undefined`.
         */
        function getNative(object, key) {
            var value = getValue(object, key);
            return baseIsNative(value) ? value : undefined;
        }

        module.exports = getNative;


        /***/
    }),
    /* 82 */
    ,
    /* 83 */
    ,
    /* 84 */
    ,
    /* 85 */
    ,
    /* 86 */
    ,
    /* 87 */
    ,
    /* 88 */
    ,
    /* 89 */
    ,
    /* 90 */
    ,
    /* 91 */
    ,
    /* 92 */
    ,
    /* 93 */
    ,
    /* 94 */
    ,
    /* 95 */
    ,
    /* 96 */
    ,
    /* 97 */
    ,
    /* 98 */
    /***/
    (function(module, exports, __webpack_require__) {

        var Symbol = __webpack_require__(205),
            getRawTag = __webpack_require__(260),
            objectToString = __webpack_require__(261);

        /** `Object#toString` result references. */
        var nullTag = '[object Null]',
            undefinedTag = '[object Undefined]';

        /** Built-in value references. */
        var symToStringTag = Symbol ? Symbol.toStringTag : undefined;

        /**
         * The base implementation of `getTag` without fallbacks for buggy environments.
         *
         * @private
         * @param {*} value The value to query.
         * @returns {string} Returns the `toStringTag`.
         */
        function baseGetTag(value) {
            if (value == null) {
                return value === undefined ? undefinedTag : nullTag;
            }
            return (symToStringTag && symToStringTag in Object(value)) ?
                getRawTag(value) :
                objectToString(value);
        }

        module.exports = baseGetTag;


        /***/
    }),
    /* 99 */
    ,
    /* 100 */
    ,
    /* 101 */
    ,
    /* 102 */
    ,
    /* 103 */
    ,
    /* 104 */
    ,
    /* 105 */
    ,
    /* 106 */
    ,
    /* 107 */
    ,
    /* 108 */
    ,
    /* 109 */
    ,
    /* 110 */
    ,
    /* 111 */
    ,
    /* 112 */
    ,
    /* 113 */
    ,
    /* 114 */
    ,
    /* 115 */
    ,
    /* 116 */
    ,
    /* 117 */
    ,
    /* 118 */
    ,
    /* 119 */
    ,
    /* 120 */
    ,
    /* 121 */
    ,
    /* 122 */
    ,
    /* 123 */
    ,
    /* 124 */
    ,
    /* 125 */
    ,
    /* 126 */
    ,
    /* 127 */
    ,
    /* 128 */
    ,
    /* 129 */
    ,
    /* 130 */
    ,
    /* 131 */
    ,
    /* 132 */
    ,
    /* 133 */
    ,
    /* 134 */
    ,
    /* 135 */
    ,
    /* 136 */
    ,
    /* 137 */
    ,
    /* 138 */
    ,
    /* 139 */
    ,
    /* 140 */
    ,
    /* 141 */
    ,
    /* 142 */
    ,
    /* 143 */
    ,
    /* 144 */
    ,
    /* 145 */
    ,
    /* 146 */
    ,
    /* 147 */
    ,
    /* 148 */
    ,
    /* 149 */
    ,
    /* 150 */
    ,
    /* 151 */
    ,
    /* 152 */
    ,
    /* 153 */
    ,
    /* 154 */
    ,
    /* 155 */
    ,
    /* 156 */
    ,
    /* 157 */
    ,
    /* 158 */
    ,
    /* 159 */
    ,
    /* 160 */
    ,
    /* 161 */
    ,
    /* 162 */
    ,
    /* 163 */
    ,
    /* 164 */
    ,
    /* 165 */
    ,
    /* 166 */
    ,
    /* 167 */
    ,
    /* 168 */
    ,
    /* 169 */
    ,
    /* 170 */
    ,
    /* 171 */
    ,
    /* 172 */
    ,
    /* 173 */
    ,
    /* 174 */
    ,
    /* 175 */
    ,
    /* 176 */
    ,
    /* 177 */
    ,
    /* 178 */
    ,
    /* 179 */
    ,
    /* 180 */
    ,
    /* 181 */
    ,
    /* 182 */
    ,
    /* 183 */
    ,
    /* 184 */
    ,
    /* 185 */
    ,
    /* 186 */
    ,
    /* 187 */
    ,
    /* 188 */
    ,
    /* 189 */
    ,
    /* 190 */
    ,
    /* 191 */
    ,
    /* 192 */
    ,
    /* 193 */
    ,
    /* 194 */
    ,
    /* 195 */
    ,
    /* 196 */
    ,
    /* 197 */
    ,
    /* 198 */
    ,
    /* 199 */
    ,
    /* 200 */
    ,
    /* 201 */
    ,
    /* 202 */
    /***/
    (function(module, exports) {

        /**
         * Checks if `value` is the
         * [language type](http://www.ecma-international.org/ecma-262/7.0/#sec-ecmascript-language-types)
         * of `Object`. (e.g. arrays, functions, objects, regexes, `new Number(0)`, and `new String('')`)
         *
         * @static
         * @memberOf _
         * @since 0.1.0
         * @category Lang
         * @param {*} value The value to check.
         * @returns {boolean} Returns `true` if `value` is an object, else `false`.
         * @example
         *
         * _.isObject({});
         * // => true
         *
         * _.isObject([1, 2, 3]);
         * // => true
         *
         * _.isObject(_.noop);
         * // => true
         *
         * _.isObject(null);
         * // => false
         */
        function isObject(value) {
            var type = typeof value;
            return value != null && (type == 'object' || type == 'function');
        }

        module.exports = isObject;


        /***/
    }),
    /* 203 */
    /***/
    (function(module, exports) {

        /**
         * Checks if `value` is object-like. A value is object-like if it's not `null`
         * and has a `typeof` result of "object".
         *
         * @static
         * @memberOf _
         * @since 4.0.0
         * @category Lang
         * @param {*} value The value to check.
         * @returns {boolean} Returns `true` if `value` is object-like, else `false`.
         * @example
         *
         * _.isObjectLike({});
         * // => true
         *
         * _.isObjectLike([1, 2, 3]);
         * // => true
         *
         * _.isObjectLike(_.noop);
         * // => false
         *
         * _.isObjectLike(null);
         * // => false
         */
        function isObjectLike(value) {
            return value != null && typeof value == 'object';
        }

        module.exports = isObjectLike;


        /***/
    }),
    /* 204 */
    /***/
    (function(module, exports, __webpack_require__) {

        // getting tag from 19.1.3.6 Object.prototype.toString()
        var cof = __webpack_require__(23);
        var TAG = __webpack_require__(4)('toStringTag');
        // ES3 wrong here
        var ARG = cof(function() { return arguments; }()) == 'Arguments';

        // fallback for IE11 Script Access Denied error
        var tryGet = function(it, key) {
            try {
                return it[key];
            } catch (e) { /* empty */ }
        };

        module.exports = function(it) {
            var O, T, B;
            return it === undefined ? 'Undefined' : it === null ? 'Null'
                // @@toStringTag case
                :
                typeof(T = tryGet(O = Object(it), TAG)) == 'string' ? T
                // builtinTag case
                :
                ARG ? cof(O)
                // ES3 arguments fallback
                :
                (B = cof(O)) == 'Object' && typeof O.callee == 'function' ? 'Arguments' : B;
        };


        /***/
    }),
    /* 205 */
    /***/
    (function(module, exports, __webpack_require__) {

        var root = __webpack_require__(69);

        /** Built-in value references. */
        var Symbol = root.Symbol;

        module.exports = Symbol;


        /***/
    }),
    /* 206 */
    /***/
    (function(module, exports, __webpack_require__) {

        var baseIsArguments = __webpack_require__(274),
            isObjectLike = __webpack_require__(203);

        /** Used for built-in method references. */
        var objectProto = Object.prototype;

        /** Used to check objects for own properties. */
        var hasOwnProperty = objectProto.hasOwnProperty;

        /** Built-in value references. */
        var propertyIsEnumerable = objectProto.propertyIsEnumerable;

        /**
         * Checks if `value` is likely an `arguments` object.
         *
         * @static
         * @memberOf _
         * @since 0.1.0
         * @category Lang
         * @param {*} value The value to check.
         * @returns {boolean} Returns `true` if `value` is an `arguments` object,
         *  else `false`.
         * @example
         *
         * _.isArguments(function() { return arguments; }());
         * // => true
         *
         * _.isArguments([1, 2, 3]);
         * // => false
         */
        var isArguments = baseIsArguments(function() { return arguments; }()) ? baseIsArguments : function(value) {
            return isObjectLike(value) && hasOwnProperty.call(value, 'callee') &&
                !propertyIsEnumerable.call(value, 'callee');
        };

        module.exports = isArguments;


        /***/
    }),
    /* 207 */
    /***/
    (function(module, exports, __webpack_require__) {

        var isFunction = __webpack_require__(50),
            isLength = __webpack_require__(220);

        /**
         * Checks if `value` is array-like. A value is considered array-like if it's
         * not a function and has a `value.length` that's an integer greater than or
         * equal to `0` and less than or equal to `Number.MAX_SAFE_INTEGER`.
         *
         * @static
         * @memberOf _
         * @since 4.0.0
         * @category Lang
         * @param {*} value The value to check.
         * @returns {boolean} Returns `true` if `value` is array-like, else `false`.
         * @example
         *
         * _.isArrayLike([1, 2, 3]);
         * // => true
         *
         * _.isArrayLike(document.body.children);
         * // => true
         *
         * _.isArrayLike('abc');
         * // => true
         *
         * _.isArrayLike(_.noop);
         * // => false
         */
        function isArrayLike(value) {
            return value != null && isLength(value.length) && !isFunction(value);
        }

        module.exports = isArrayLike;


        /***/
    }),
    /* 208 */
    /***/
    (function(module, exports, __webpack_require__) {

        var isArray = __webpack_require__(70),
            isKey = __webpack_require__(287),
            stringToPath = __webpack_require__(288),
            toString = __webpack_require__(310);

        /**
         * Casts `value` to a path array if it's not one.
         *
         * @private
         * @param {*} value The value to inspect.
         * @param {Object} [object] The object to query keys on.
         * @returns {Array} Returns the cast property path array.
         */
        function castPath(value, object) {
            if (isArray(value)) {
                return value;
            }
            return isKey(value, object) ? [value] : stringToPath(toString(value));
        }

        module.exports = castPath;


        /***/
    }),
    /* 209 */
    /***/
    (function(module, exports, __webpack_require__) {

        var getNative = __webpack_require__(81);

        /* Built-in method references that are verified to be native. */
        var nativeCreate = getNative(Object, 'create');

        module.exports = nativeCreate;


        /***/
    }),
    /* 210 */
    /***/
    (function(module, exports, __webpack_require__) {

        var eq = __webpack_require__(222);

        /**
         * Gets the index at which the `key` is found in `array` of key-value pairs.
         *
         * @private
         * @param {Array} array The array to inspect.
         * @param {*} key The key to search for.
         * @returns {number} Returns the index of the matched value, else `-1`.
         */
        function assocIndexOf(array, key) {
            var length = array.length;
            while (length--) {
                if (eq(array[length][0], key)) {
                    return length;
                }
            }
            return -1;
        }

        module.exports = assocIndexOf;


        /***/
    }),
    /* 211 */
    /***/
    (function(module, exports, __webpack_require__) {

        var isKeyable = __webpack_require__(306);

        /**
         * Gets the data for `map`.
         *
         * @private
         * @param {Object} map The map to query.
         * @param {string} key The reference key.
         * @returns {*} Returns the map data.
         */
        function getMapData(map, key) {
            var data = map.__data__;
            return isKeyable(key) ?
                data[typeof key == 'string' ? 'string' : 'hash'] :
                data.map;
        }

        module.exports = getMapData;


        /***/
    }),
    /* 212 */
    /***/
    (function(module, exports) {

        /** Used as references for various `Number` constants. */
        var MAX_SAFE_INTEGER = 9007199254740991;

        /** Used to detect unsigned integer values. */
        var reIsUint = /^(?:0|[1-9]\d*)$/;

        /**
         * Checks if `value` is a valid array-like index.
         *
         * @private
         * @param {*} value The value to check.
         * @param {number} [length=MAX_SAFE_INTEGER] The upper bounds of a valid index.
         * @returns {boolean} Returns `true` if `value` is a valid index, else `false`.
         */
        function isIndex(value, length) {
            length = length == null ? MAX_SAFE_INTEGER : length;
            return !!length &&
                (typeof value == 'number' || reIsUint.test(value)) &&
                (value > -1 && value % 1 == 0 && value < length);
        }

        module.exports = isIndex;


        /***/
    }),
    /* 213 */
    /***/
    (function(module, exports, __webpack_require__) {

        // call something on iterator step with safe closing on error
        var anObject = __webpack_require__(11);
        module.exports = function(iterator, fn, value, entries) {
            try {
                return entries ? fn(anObject(value)[0], value[1]) : fn(value);
                // 7.4.6 IteratorClose(iterator, completion)
            } catch (e) {
                var ret = iterator['return'];
                if (ret !== undefined) anObject(ret.call(iterator));
                throw e;
            }
        };


        /***/
    }),
    /* 214 */
    /***/
    (function(module, exports, __webpack_require__) {

        // check on default Array iterator
        var Iterators = __webpack_require__(25);
        var ITERATOR = __webpack_require__(4)('iterator');
        var ArrayProto = Array.prototype;

        module.exports = function(it) {
            return it !== undefined && (Iterators.Array === it || ArrayProto[ITERATOR] === it);
        };


        /***/
    }),
    /* 215 */
    /***/
    (function(module, exports, __webpack_require__) {

        var classof = __webpack_require__(204);
        var ITERATOR = __webpack_require__(4)('iterator');
        var Iterators = __webpack_require__(25);
        module.exports = __webpack_require__(1).getIteratorMethod = function(it) {
            if (it != undefined) return it[ITERATOR] ||
                it['@@iterator'] ||
                Iterators[classof(it)];
        };


        /***/
    }),
    /* 216 */
    /***/
    (function(module, exports, __webpack_require__) {

        "use strict";

        // 25.4.1.5 NewPromiseCapability(C)
        var aFunction = __webpack_require__(35);

        function PromiseCapability(C) {
            var resolve, reject;
            this.promise = new C(function($$resolve, $$reject) {
                if (resolve !== undefined || reject !== undefined) throw TypeError('Bad Promise constructor');
                resolve = $$resolve;
                reject = $$reject;
            });
            this.resolve = aFunction(resolve);
            this.reject = aFunction(reject);
        }

        module.exports.f = function(C) {
            return new PromiseCapability(C);
        };


        /***/
    }),
    /* 217 */
    /***/
    (function(module, exports, __webpack_require__) {

        var ITERATOR = __webpack_require__(4)('iterator');
        var SAFE_CLOSING = false;

        try {
            var riter = [7][ITERATOR]();
            riter['return'] = function() { SAFE_CLOSING = true; };
            // eslint-disable-next-line no-throw-literal
            Array.from(riter, function() { throw 2; });
        } catch (e) { /* empty */ }

        module.exports = function(exec, skipClosing) {
            if (!skipClosing && !SAFE_CLOSING) return false;
            var safe = false;
            try {
                var arr = [7];
                var iter = arr[ITERATOR]();
                iter.next = function() { return { done: safe = true }; };
                arr[ITERATOR] = function() { return iter; };
                exec(arr);
            } catch (e) { /* empty */ }
            return safe;
        };


        /***/
    }),
    /* 218 */
    /***/
    (function(module, exports, __webpack_require__) {

        var baseKeys = __webpack_require__(231),
            getTag = __webpack_require__(265),
            isArguments = __webpack_require__(206),
            isArray = __webpack_require__(70),
            isArrayLike = __webpack_require__(207),
            isBuffer = __webpack_require__(235),
            isPrototype = __webpack_require__(219),
            isTypedArray = __webpack_require__(236);

        /** `Object#toString` result references. */
        var mapTag = '[object Map]',
            setTag = '[object Set]';

        /** Used for built-in method references. */
        var objectProto = Object.prototype;

        /** Used to check objects for own properties. */
        var hasOwnProperty = objectProto.hasOwnProperty;

        /**
         * Checks if `value` is an empty object, collection, map, or set.
         *
         * Objects are considered empty if they have no own enumerable string keyed
         * properties.
         *
         * Array-like values such as `arguments` objects, arrays, buffers, strings, or
         * jQuery-like collections are considered empty if they have a `length` of `0`.
         * Similarly, maps and sets are considered empty if they have a `size` of `0`.
         *
         * @static
         * @memberOf _
         * @since 0.1.0
         * @category Lang
         * @param {*} value The value to check.
         * @returns {boolean} Returns `true` if `value` is empty, else `false`.
         * @example
         *
         * _.isEmpty(null);
         * // => true
         *
         * _.isEmpty(true);
         * // => true
         *
         * _.isEmpty(1);
         * // => true
         *
         * _.isEmpty([1, 2, 3]);
         * // => false
         *
         * _.isEmpty({ 'a': 1 });
         * // => false
         */
        function isEmpty(value) {
            if (value == null) {
                return true;
            }
            if (isArrayLike(value) &&
                (isArray(value) || typeof value == 'string' || typeof value.splice == 'function' ||
                    isBuffer(value) || isTypedArray(value) || isArguments(value))) {
                return !value.length;
            }
            var tag = getTag(value);
            if (tag == mapTag || tag == setTag) {
                return !value.size;
            }
            if (isPrototype(value)) {
                return !baseKeys(value).length;
            }
            for (var key in value) {
                if (hasOwnProperty.call(value, key)) {
                    return false;
                }
            }
            return true;
        }

        module.exports = isEmpty;


        /***/
    }),
    /* 219 */
    /***/
    (function(module, exports) {

        /** Used for built-in method references. */
        var objectProto = Object.prototype;

        /**
         * Checks if `value` is likely a prototype object.
         *
         * @private
         * @param {*} value The value to check.
         * @returns {boolean} Returns `true` if `value` is a prototype, else `false`.
         */
        function isPrototype(value) {
            var Ctor = value && value.constructor,
                proto = (typeof Ctor == 'function' && Ctor.prototype) || objectProto;

            return value === proto;
        }

        module.exports = isPrototype;


        /***/
    }),
    /* 220 */
    /***/
    (function(module, exports) {

        /** Used as references for various `Number` constants. */
        var MAX_SAFE_INTEGER = 9007199254740991;

        /**
         * Checks if `value` is a valid array-like length.
         *
         * **Note:** This method is loosely based on
         * [`ToLength`](http://ecma-international.org/ecma-262/7.0/#sec-tolength).
         *
         * @static
         * @memberOf _
         * @since 4.0.0
         * @category Lang
         * @param {*} value The value to check.
         * @returns {boolean} Returns `true` if `value` is a valid length, else `false`.
         * @example
         *
         * _.isLength(3);
         * // => true
         *
         * _.isLength(Number.MIN_VALUE);
         * // => false
         *
         * _.isLength(Infinity);
         * // => false
         *
         * _.isLength('3');
         * // => false
         */
        function isLength(value) {
            return typeof value == 'number' &&
                value > -1 && value % 1 == 0 && value <= MAX_SAFE_INTEGER;
        }

        module.exports = isLength;


        /***/
    }),
    /* 221 */
    /***/
    (function(module, exports, __webpack_require__) {

        var baseGetTag = __webpack_require__(98),
            isObjectLike = __webpack_require__(203);

        /** `Object#toString` result references. */
        var symbolTag = '[object Symbol]';

        /**
         * Checks if `value` is classified as a `Symbol` primitive or object.
         *
         * @static
         * @memberOf _
         * @since 4.0.0
         * @category Lang
         * @param {*} value The value to check.
         * @returns {boolean} Returns `true` if `value` is a symbol, else `false`.
         * @example
         *
         * _.isSymbol(Symbol.iterator);
         * // => true
         *
         * _.isSymbol('abc');
         * // => false
         */
        function isSymbol(value) {
            return typeof value == 'symbol' ||
                (isObjectLike(value) && baseGetTag(value) == symbolTag);
        }

        module.exports = isSymbol;


        /***/
    }),
    /* 222 */
    /***/
    (function(module, exports) {

        /**
         * Performs a
         * [`SameValueZero`](http://ecma-international.org/ecma-262/7.0/#sec-samevaluezero)
         * comparison between two values to determine if they are equivalent.
         *
         * @static
         * @memberOf _
         * @since 4.0.0
         * @category Lang
         * @param {*} value The value to compare.
         * @param {*} other The other value to compare.
         * @returns {boolean} Returns `true` if the values are equivalent, else `false`.
         * @example
         *
         * var object = { 'a': 1 };
         * var other = { 'a': 1 };
         *
         * _.eq(object, object);
         * // => true
         *
         * _.eq(object, other);
         * // => false
         *
         * _.eq('a', 'a');
         * // => true
         *
         * _.eq('a', Object('a'));
         * // => false
         *
         * _.eq(NaN, NaN);
         * // => true
         */
        function eq(value, other) {
            return value === other || (value !== value && other !== other);
        }

        module.exports = eq;


        /***/
    }),
    /* 223 */
    /***/
    (function(module, exports, __webpack_require__) {

        var isSymbol = __webpack_require__(221);

        /** Used as references for various `Number` constants. */
        var INFINITY = 1 / 0;

        /**
         * Converts `value` to a string key if it's not a string or symbol.
         *
         * @private
         * @param {*} value The value to inspect.
         * @returns {string|symbol} Returns the key.
         */
        function toKey(value) {
            if (typeof value == 'string' || isSymbol(value)) {
                return value;
            }
            var result = (value + '');
            return (result == '0' && (1 / value) == -INFINITY) ? '-0' : result;
        }

        module.exports = toKey;


        /***/
    }),
    /* 224 */
    /***/
    (function(module, exports, __webpack_require__) {

        var baseAssignValue = __webpack_require__(240),
            eq = __webpack_require__(222);

        /** Used for built-in method references. */
        var objectProto = Object.prototype;

        /** Used to check objects for own properties. */
        var hasOwnProperty = objectProto.hasOwnProperty;

        /**
         * Assigns `value` to `key` of `object` if the existing value is not equivalent
         * using [`SameValueZero`](http://ecma-international.org/ecma-262/7.0/#sec-samevaluezero)
         * for equality comparisons.
         *
         * @private
         * @param {Object} object The object to modify.
         * @param {string} key The key of the property to assign.
         * @param {*} value The value to assign.
         */
        function assignValue(object, key, value) {
            var objValue = object[key];
            if (!(hasOwnProperty.call(object, key) && eq(objValue, value)) ||
                (value === undefined && !(key in object))) {
                baseAssignValue(object, key, value);
            }
        }

        module.exports = assignValue;


        /***/
    }),
    /* 225 */
    /***/
    (function(module, exports, __webpack_require__) {

        module.exports = { "default": __webpack_require__(237), __esModule: true };

        /***/
    }),
    /* 226 */
    /***/
    (function(module, exports, __webpack_require__) {

        // 7.3.20 SpeciesConstructor(O, defaultConstructor)
        var anObject = __webpack_require__(11);
        var aFunction = __webpack_require__(35);
        var SPECIES = __webpack_require__(4)('species');
        module.exports = function(O, D) {
            var C = anObject(O).constructor;
            var S;
            return C === undefined || (S = anObject(C)[SPECIES]) == undefined ? D : aFunction(S);
        };


        /***/
    }),
    /* 227 */
    /***/
    (function(module, exports, __webpack_require__) {

        var ctx = __webpack_require__(29);
        var invoke = __webpack_require__(252);
        var html = __webpack_require__(55);
        var cel = __webpack_require__(28);
        var global = __webpack_require__(0);
        var process = global.process;
        var setTask = global.setImmediate;
        var clearTask = global.clearImmediate;
        var MessageChannel = global.MessageChannel;
        var Dispatch = global.Dispatch;
        var counter = 0;
        var queue = {};
        var ONREADYSTATECHANGE = 'onreadystatechange';
        var defer, channel, port;
        var run = function() {
            var id = +this;
            // eslint-disable-next-line no-prototype-builtins
            if (queue.hasOwnProperty(id)) {
                var fn = queue[id];
                delete queue[id];
                fn();
            }
        };
        var listener = function(event) {
            run.call(event.data);
        };
        // Node.js 0.9+ & IE10+ has setImmediate, otherwise:
        if (!setTask || !clearTask) {
            setTask = function setImmediate(fn) {
                var args = [];
                var i = 1;
                while (arguments.length > i) args.push(arguments[i++]);
                queue[++counter] = function() {
                    // eslint-disable-next-line no-new-func
                    invoke(typeof fn == 'function' ? fn : Function(fn), args);
                };
                defer(counter);
                return counter;
            };
            clearTask = function clearImmediate(id) {
                delete queue[id];
            };
            // Node.js 0.8-
            if (__webpack_require__(23)(process) == 'process') {
                defer = function(id) {
                    process.nextTick(ctx(run, id, 1));
                };
                // Sphere (JS game engine) Dispatch API
            } else if (Dispatch && Dispatch.now) {
                defer = function(id) {
                    Dispatch.now(ctx(run, id, 1));
                };
                // Browsers with MessageChannel, includes WebWorkers
            } else if (MessageChannel) {
                channel = new MessageChannel();
                port = channel.port2;
                channel.port1.onmessage = listener;
                defer = ctx(port.postMessage, port, 1);
                // Browsers with postMessage, skip WebWorkers
                // IE8 has postMessage, but it's sync & typeof its postMessage is 'object'
            } else if (global.addEventListener && typeof postMessage == 'function' && !global.importScripts) {
                defer = function(id) {
                    global.postMessage(id + '', '*');
                };
                global.addEventListener('message', listener, false);
                // IE8-
            } else if (ONREADYSTATECHANGE in cel('script')) {
                defer = function(id) {
                    html.appendChild(cel('script'))[ONREADYSTATECHANGE] = function() {
                        html.removeChild(this);
                        run.call(id);
                    };
                };
                // Rest old browsers
            } else {
                defer = function(id) {
                    setTimeout(ctx(run, id, 1), 0);
                };
            }
        }
        module.exports = {
            set: setTask,
            clear: clearTask
        };


        /***/
    }),
    /* 228 */
    /***/
    (function(module, exports) {

        module.exports = function(exec) {
            try {
                return { e: false, v: exec() };
            } catch (e) {
                return { e: true, v: e };
            }
        };


        /***/
    }),
    /* 229 */
    /***/
    (function(module, exports, __webpack_require__) {

        var anObject = __webpack_require__(11);
        var isObject = __webpack_require__(9);
        var newPromiseCapability = __webpack_require__(216);

        module.exports = function(C, x) {
            anObject(C);
            if (isObject(x) && x.constructor === C) return x;
            var promiseCapability = newPromiseCapability.f(C);
            var resolve = promiseCapability.resolve;
            resolve(x);
            return promiseCapability.promise;
        };


        /***/
    }),
    /* 230 */
    /***/
    (function(module, exports, __webpack_require__) {

        /* WEBPACK VAR INJECTION */
        (function(global) { /** Detect free variable `global` from Node.js. */
            var freeGlobal = typeof global == 'object' && global && global.Object === Object && global;

            module.exports = freeGlobal;

            /* WEBPACK VAR INJECTION */
        }.call(exports, __webpack_require__(64)))

        /***/
    }),
    /* 231 */
    /***/
    (function(module, exports, __webpack_require__) {

        var isPrototype = __webpack_require__(219),
            nativeKeys = __webpack_require__(264);

        /** Used for built-in method references. */
        var objectProto = Object.prototype;

        /** Used to check objects for own properties. */
        var hasOwnProperty = objectProto.hasOwnProperty;

        /**
         * The base implementation of `_.keys` which doesn't treat sparse arrays as dense.
         *
         * @private
         * @param {Object} object The object to query.
         * @returns {Array} Returns the array of property names.
         */
        function baseKeys(object) {
            if (!isPrototype(object)) {
                return nativeKeys(object);
            }
            var result = [];
            for (var key in Object(object)) {
                if (hasOwnProperty.call(object, key) && key != 'constructor') {
                    result.push(key);
                }
            }
            return result;
        }

        module.exports = baseKeys;


        /***/
    }),
    /* 232 */
    /***/
    (function(module, exports) {

        /**
         * Creates a unary function that invokes `func` with its argument transformed.
         *
         * @private
         * @param {Function} func The function to wrap.
         * @param {Function} transform The argument transform.
         * @returns {Function} Returns the new function.
         */
        function overArg(func, transform) {
            return function(arg) {
                return func(transform(arg));
            };
        }

        module.exports = overArg;


        /***/
    }),
    /* 233 */
    /***/
    (function(module, exports) {

        /** Used for built-in method references. */
        var funcProto = Function.prototype;

        /** Used to resolve the decompiled source of functions. */
        var funcToString = funcProto.toString;

        /**
         * Converts `func` to its source code.
         *
         * @private
         * @param {Function} func The function to convert.
         * @returns {string} Returns the source code.
         */
        function toSource(func) {
            if (func != null) {
                try {
                    return funcToString.call(func);
                } catch (e) {}
                try {
                    return (func + '');
                } catch (e) {}
            }
            return '';
        }

        module.exports = toSource;


        /***/
    }),
    /* 234 */
    /***/
    (function(module, exports, __webpack_require__) {

        var getNative = __webpack_require__(81),
            root = __webpack_require__(69);

        /* Built-in method references that are verified to be native. */
        var Map = getNative(root, 'Map');

        module.exports = Map;


        /***/
    }),
    /* 235 */
    /***/
    (function(module, exports, __webpack_require__) {

        /* WEBPACK VAR INJECTION */
        (function(module) {
            var root = __webpack_require__(69),
                stubFalse = __webpack_require__(275);

            /** Detect free variable `exports`. */
            var freeExports = typeof exports == 'object' && exports && !exports.nodeType && exports;

            /** Detect free variable `module`. */
            var freeModule = freeExports && typeof module == 'object' && module && !module.nodeType && module;

            /** Detect the popular CommonJS extension `module.exports`. */
            var moduleExports = freeModule && freeModule.exports === freeExports;

            /** Built-in value references. */
            var Buffer = moduleExports ? root.Buffer : undefined;

            /* Built-in method references for those with the same name as other `lodash` methods. */
            var nativeIsBuffer = Buffer ? Buffer.isBuffer : undefined;

            /**
             * Checks if `value` is a buffer.
             *
             * @static
             * @memberOf _
             * @since 4.3.0
             * @category Lang
             * @param {*} value The value to check.
             * @returns {boolean} Returns `true` if `value` is a buffer, else `false`.
             * @example
             *
             * _.isBuffer(new Buffer(2));
             * // => true
             *
             * _.isBuffer(new Uint8Array(2));
             * // => false
             */
            var isBuffer = nativeIsBuffer || stubFalse;

            module.exports = isBuffer;

            /* WEBPACK VAR INJECTION */
        }.call(exports, __webpack_require__(65)(module)))

        /***/
    }),
    /* 236 */
    /***/
    (function(module, exports, __webpack_require__) {

        var baseIsTypedArray = __webpack_require__(276),
            baseUnary = __webpack_require__(277),
            nodeUtil = __webpack_require__(278);

        /* Node.js helper references. */
        var nodeIsTypedArray = nodeUtil && nodeUtil.isTypedArray;

        /**
         * Checks if `value` is classified as a typed array.
         *
         * @static
         * @memberOf _
         * @since 3.0.0
         * @category Lang
         * @param {*} value The value to check.
         * @returns {boolean} Returns `true` if `value` is a typed array, else `false`.
         * @example
         *
         * _.isTypedArray(new Uint8Array);
         * // => true
         *
         * _.isTypedArray([]);
         * // => false
         */
        var isTypedArray = nodeIsTypedArray ? baseUnary(nodeIsTypedArray) : baseIsTypedArray;

        module.exports = isTypedArray;


        /***/
    }),
    /* 237 */
    /***/
    (function(module, exports, __webpack_require__) {

        __webpack_require__(238);
        module.exports = __webpack_require__(1).Object.keys;


        /***/
    }),
    /* 238 */
    /***/
    (function(module, exports, __webpack_require__) {

        // 19.1.2.14 Object.keys(O)
        var toObject = __webpack_require__(26);
        var $keys = __webpack_require__(13);

        __webpack_require__(239)('keys', function() {
            return function keys(it) {
                return $keys(toObject(it));
            };
        });


        /***/
    }),
    /* 239 */
    /***/
    (function(module, exports, __webpack_require__) {

        // most Object methods by ES6 should accept primitives
        var $export = __webpack_require__(10);
        var core = __webpack_require__(1);
        var fails = __webpack_require__(6);
        module.exports = function(KEY, exec) {
            var fn = (core.Object || {})[KEY] || Object[KEY];
            var exp = {};
            exp[KEY] = exec(fn);
            $export($export.S + $export.F * fails(function() { fn(1); }), 'Object', exp);
        };


        /***/
    }),
    /* 240 */
    /***/
    (function(module, exports, __webpack_require__) {

        var defineProperty = __webpack_require__(241);

        /**
         * The base implementation of `assignValue` and `assignMergeValue` without
         * value checks.
         *
         * @private
         * @param {Object} object The object to modify.
         * @param {string} key The key of the property to assign.
         * @param {*} value The value to assign.
         */
        function baseAssignValue(object, key, value) {
            if (key == '__proto__' && defineProperty) {
                defineProperty(object, key, {
                    'configurable': true,
                    'enumerable': true,
                    'value': value,
                    'writable': true
                });
            } else {
                object[key] = value;
            }
        }

        module.exports = baseAssignValue;


        /***/
    }),
    /* 241 */
    /***/
    (function(module, exports, __webpack_require__) {

        var getNative = __webpack_require__(81);

        var defineProperty = (function() {
            try {
                var func = getNative(Object, 'defineProperty');
                func({}, '', {});
                return func;
            } catch (e) {}
        }());

        module.exports = defineProperty;


        /***/
    }),
    /* 242 */
    /***/
    (function(module, exports, __webpack_require__) {

        var apply = __webpack_require__(322);

        /* Built-in method references for those with the same name as other `lodash` methods. */
        var nativeMax = Math.max;

        /**
         * A specialized version of `baseRest` which transforms the rest array.
         *
         * @private
         * @param {Function} func The function to apply a rest parameter to.
         * @param {number} [start=func.length-1] The start position of the rest parameter.
         * @param {Function} transform The rest array transform.
         * @returns {Function} Returns the new function.
         */
        function overRest(func, start, transform) {
            start = nativeMax(start === undefined ? (func.length - 1) : start, 0);
            return function() {
                var args = arguments,
                    index = -1,
                    length = nativeMax(args.length - start, 0),
                    array = Array(length);

                while (++index < length) {
                    array[index] = args[start + index];
                }
                index = -1;
                var otherArgs = Array(start + 1);
                while (++index < start) {
                    otherArgs[index] = args[index];
                }
                otherArgs[start] = transform(array);
                return apply(func, this, otherArgs);
            };
        }

        module.exports = overRest;


        /***/
    }),
    /* 243 */
    /***/
    (function(module, exports, __webpack_require__) {

        var baseSetToString = __webpack_require__(323),
            shortOut = __webpack_require__(325);

        /**
         * Sets the `toString` method of `func` to return `string`.
         *
         * @private
         * @param {Function} func The function to modify.
         * @param {Function} string The `toString` result.
         * @returns {Function} Returns `func`.
         */
        var setToString = shortOut(baseSetToString);

        module.exports = setToString;


        /***/
    }),
    /* 244 */
    /***/
    (function(module, exports) {

        /**
         * This method returns the first argument it receives.
         *
         * @static
         * @since 0.1.0
         * @memberOf _
         * @category Util
         * @param {*} value Any value.
         * @returns {*} Returns `value`.
         * @example
         *
         * var object = { 'a': 1 };
         *
         * console.log(_.identity(object) === object);
         * // => true
         */
        function identity(value) {
            return value;
        }

        module.exports = identity;


        /***/
    }),
    /* 245 */
    ,
    /* 246 */
    /***/
    (function(module, exports, __webpack_require__) {

        "use strict";


        __webpack_require__(247);

        __webpack_require__(262);

        __webpack_require__(263);

        __webpack_require__(282);

        __webpack_require__(335);

        __webpack_require__(336);

        __webpack_require__(337);

        __webpack_require__(338);

        __webpack_require__(339);

        __webpack_require__(340);

        __webpack_require__(341);

        __webpack_require__(342);

        /***/
    }),
    /* 247 */
    /***/
    (function(module, exports, __webpack_require__) {

        "use strict";


        var _promise = __webpack_require__(53);

        var _promise2 = _interopRequireDefault(_promise);

        var _create = __webpack_require__(49);

        var _create2 = _interopRequireDefault(_create);

        var _isFunction = __webpack_require__(50);

        var _isFunction2 = _interopRequireDefault(_isFunction);

        function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

        var bmFont = weex.requireModule('bmFont');
        /**
         * @Author: songqi
         * @Date:   2017-01-11
         * @Last modified by:   songqi
         * @Last modified time: 2017-05-08
         */

        var Font = (0, _create2.default)(null);

        Font.install = function(Vue, options) {
            Vue.prototype.$font = {
                changeFontSize: function changeFontSize(options) {
                    var _this = this;

                    return new _promise2.default(function(resolve, reject) {
                        bmFont.changeFontSize({
                            fontSize: options.fontSize || 'NORM'
                        }, function(resData) {
                            if ((0, _isFunction2.default)(options.callback)) {
                                options.callback.call(_this, data);
                            }
                            if (resData && resData.resCode == 0) {
                                resolve(resData);
                            } else {
                                reject(resData);
                            }
                        });
                    });
                },
                getFontSize: function getFontSize(callback) {
                    var _this2 = this;

                    return new _promise2.default(function(resolve, reject) {
                        bmFont.getFontSize(function(resData) {
                            if ((0, _isFunction2.default)(callback)) {
                                callback.call(_this2, resData);
                            }
                            if (resData && resData.resCode == 0) {
                                resolve(resData);
                            } else {
                                reject(resData);
                            }
                        });
                    });
                }
            };
        };

        Vue.use(Font);

        /***/
    }),
    /* 248 */
    /***/
    (function(module, exports, __webpack_require__) {

        __webpack_require__(62);
        __webpack_require__(54);
        __webpack_require__(63);
        __webpack_require__(249);
        __webpack_require__(256);
        __webpack_require__(257);
        module.exports = __webpack_require__(1).Promise;


        /***/
    }),
    /* 249 */
    /***/
    (function(module, exports, __webpack_require__) {

        "use strict";

        var LIBRARY = __webpack_require__(34);
        var global = __webpack_require__(0);
        var ctx = __webpack_require__(29);
        var classof = __webpack_require__(204);
        var $export = __webpack_require__(10);
        var isObject = __webpack_require__(9);
        var aFunction = __webpack_require__(35);
        var anInstance = __webpack_require__(250);
        var forOf = __webpack_require__(251);
        var speciesConstructor = __webpack_require__(226);
        var task = __webpack_require__(227).set;
        var microtask = __webpack_require__(253)();
        var newPromiseCapabilityModule = __webpack_require__(216);
        var perform = __webpack_require__(228);
        var promiseResolve = __webpack_require__(229);
        var PROMISE = 'Promise';
        var TypeError = global.TypeError;
        var process = global.process;
        var $Promise = global[PROMISE];
        var isNode = classof(process) == 'process';
        var empty = function() { /* empty */ };
        var Internal, newGenericPromiseCapability, OwnPromiseCapability, Wrapper;
        var newPromiseCapability = newGenericPromiseCapability = newPromiseCapabilityModule.f;

        var USE_NATIVE = !! function() {
            try {
                // correct subclassing with @@species support
                var promise = $Promise.resolve(1);
                var FakePromise = (promise.constructor = {})[__webpack_require__(4)('species')] = function(exec) {
                    exec(empty, empty);
                };
                // unhandled rejections tracking support, NodeJS Promise without it fails @@species test
                return (isNode || typeof PromiseRejectionEvent == 'function') && promise.then(empty) instanceof FakePromise;
            } catch (e) { /* empty */ }
        }();

        // helpers
        var isThenable = function(it) {
            var then;
            return isObject(it) && typeof(then = it.then) == 'function' ? then : false;
        };
        var notify = function(promise, isReject) {
            if (promise._n) return;
            promise._n = true;
            var chain = promise._c;
            microtask(function() {
                var value = promise._v;
                var ok = promise._s == 1;
                var i = 0;
                var run = function(reaction) {
                    var handler = ok ? reaction.ok : reaction.fail;
                    var resolve = reaction.resolve;
                    var reject = reaction.reject;
                    var domain = reaction.domain;
                    var result, then;
                    try {
                        if (handler) {
                            if (!ok) {
                                if (promise._h == 2) onHandleUnhandled(promise);
                                promise._h = 1;
                            }
                            if (handler === true) result = value;
                            else {
                                if (domain) domain.enter();
                                result = handler(value);
                                if (domain) domain.exit();
                            }
                            if (result === reaction.promise) {
                                reject(TypeError('Promise-chain cycle'));
                            } else if (then = isThenable(result)) {
                                then.call(result, resolve, reject);
                            } else resolve(result);
                        } else reject(value);
                    } catch (e) {
                        reject(e);
                    }
                };
                while (chain.length > i) run(chain[i++]); // variable length - can't use forEach
                promise._c = [];
                promise._n = false;
                if (isReject && !promise._h) onUnhandled(promise);
            });
        };
        var onUnhandled = function(promise) {
            task.call(global, function() {
                var value = promise._v;
                var unhandled = isUnhandled(promise);
                var result, handler, console;
                if (unhandled) {
                    result = perform(function() {
                        if (isNode) {
                            process.emit('unhandledRejection', value, promise);
                        } else if (handler = global.onunhandledrejection) {
                            handler({ promise: promise, reason: value });
                        } else if ((console = global.console) && console.error) {
                            console.error('Unhandled promise rejection', value);
                        }
                    });
                    // Browsers should not trigger `rejectionHandled` event if it was handled here, NodeJS - should
                    promise._h = isNode || isUnhandled(promise) ? 2 : 1;
                }
                promise._a = undefined;
                if (unhandled && result.e) throw result.v;
            });
        };
        var isUnhandled = function(promise) {
            if (promise._h == 1) return false;
            var chain = promise._a || promise._c;
            var i = 0;
            var reaction;
            while (chain.length > i) {
                reaction = chain[i++];
                if (reaction.fail || !isUnhandled(reaction.promise)) return false;
            }
            return true;
        };
        var onHandleUnhandled = function(promise) {
            task.call(global, function() {
                var handler;
                if (isNode) {
                    process.emit('rejectionHandled', promise);
                } else if (handler = global.onrejectionhandled) {
                    handler({ promise: promise, reason: promise._v });
                }
            });
        };
        var $reject = function(value) {
            var promise = this;
            if (promise._d) return;
            promise._d = true;
            promise = promise._w || promise; // unwrap
            promise._v = value;
            promise._s = 2;
            if (!promise._a) promise._a = promise._c.slice();
            notify(promise, true);
        };
        var $resolve = function(value) {
            var promise = this;
            var then;
            if (promise._d) return;
            promise._d = true;
            promise = promise._w || promise; // unwrap
            try {
                if (promise === value) throw TypeError("Promise can't be resolved itself");
                if (then = isThenable(value)) {
                    microtask(function() {
                        var wrapper = { _w: promise, _d: false }; // wrap
                        try {
                            then.call(value, ctx($resolve, wrapper, 1), ctx($reject, wrapper, 1));
                        } catch (e) {
                            $reject.call(wrapper, e);
                        }
                    });
                } else {
                    promise._v = value;
                    promise._s = 1;
                    notify(promise, false);
                }
            } catch (e) {
                $reject.call({ _w: promise, _d: false }, e); // wrap
            }
        };

        // constructor polyfill
        if (!USE_NATIVE) {
            // 25.4.3.1 Promise(executor)
            $Promise = function Promise(executor) {
                anInstance(this, $Promise, PROMISE, '_h');
                aFunction(executor);
                Internal.call(this);
                try {
                    executor(ctx($resolve, this, 1), ctx($reject, this, 1));
                } catch (err) {
                    $reject.call(this, err);
                }
            };
            // eslint-disable-next-line no-unused-vars
            Internal = function Promise(executor) {
                this._c = []; // <- awaiting reactions
                this._a = undefined; // <- checked in isUnhandled reactions
                this._s = 0; // <- state
                this._d = false; // <- done
                this._v = undefined; // <- value
                this._h = 0; // <- rejection state, 0 - default, 1 - handled, 2 - unhandled
                this._n = false; // <- notify
            };
            Internal.prototype = __webpack_require__(254)($Promise.prototype, {
                // 25.4.5.3 Promise.prototype.then(onFulfilled, onRejected)
                then: function then(onFulfilled, onRejected) {
                    var reaction = newPromiseCapability(speciesConstructor(this, $Promise));
                    reaction.ok = typeof onFulfilled == 'function' ? onFulfilled : true;
                    reaction.fail = typeof onRejected == 'function' && onRejected;
                    reaction.domain = isNode ? process.domain : undefined;
                    this._c.push(reaction);
                    if (this._a) this._a.push(reaction);
                    if (this._s) notify(this, false);
                    return reaction.promise;
                },
                // 25.4.5.1 Promise.prototype.catch(onRejected)
                'catch': function(onRejected) {
                    return this.then(undefined, onRejected);
                }
            });
            OwnPromiseCapability = function() {
                var promise = new Internal();
                this.promise = promise;
                this.resolve = ctx($resolve, promise, 1);
                this.reject = ctx($reject, promise, 1);
            };
            newPromiseCapabilityModule.f = newPromiseCapability = function(C) {
                return C === $Promise || C === Wrapper ?
                    new OwnPromiseCapability(C) :
                    newGenericPromiseCapability(C);
            };
        }

        $export($export.G + $export.W + $export.F * !USE_NATIVE, { Promise: $Promise });
        __webpack_require__(32)($Promise, PROMISE);
        __webpack_require__(255)(PROMISE);
        Wrapper = __webpack_require__(1)[PROMISE];

        // statics
        $export($export.S + $export.F * !USE_NATIVE, PROMISE, {
            // 25.4.4.5 Promise.reject(r)
            reject: function reject(r) {
                var capability = newPromiseCapability(this);
                var $$reject = capability.reject;
                $$reject(r);
                return capability.promise;
            }
        });
        $export($export.S + $export.F * (LIBRARY || !USE_NATIVE), PROMISE, {
            // 25.4.4.6 Promise.resolve(x)
            resolve: function resolve(x) {
                return promiseResolve(LIBRARY && this === Wrapper ? $Promise : this, x);
            }
        });
        $export($export.S + $export.F * !(USE_NATIVE && __webpack_require__(217)(function(iter) {
            $Promise.all(iter)['catch'](empty);
        })), PROMISE, {
            // 25.4.4.1 Promise.all(iterable)
            all: function all(iterable) {
                var C = this;
                var capability = newPromiseCapability(C);
                var resolve = capability.resolve;
                var reject = capability.reject;
                var result = perform(function() {
                    var values = [];
                    var index = 0;
                    var remaining = 1;
                    forOf(iterable, false, function(promise) {
                        var $index = index++;
                        var alreadyCalled = false;
                        values.push(undefined);
                        remaining++;
                        C.resolve(promise).then(function(value) {
                            if (alreadyCalled) return;
                            alreadyCalled = true;
                            values[$index] = value;
                            --remaining || resolve(values);
                        }, reject);
                    });
                    --remaining || resolve(values);
                });
                if (result.e) reject(result.v);
                return capability.promise;
            },
            // 25.4.4.4 Promise.race(iterable)
            race: function race(iterable) {
                var C = this;
                var capability = newPromiseCapability(C);
                var reject = capability.reject;
                var result = perform(function() {
                    forOf(iterable, false, function(promise) {
                        C.resolve(promise).then(capability.resolve, reject);
                    });
                });
                if (result.e) reject(result.v);
                return capability.promise;
            }
        });


        /***/
    }),
    /* 250 */
    /***/
    (function(module, exports) {

        module.exports = function(it, Constructor, name, forbiddenField) {
            if (!(it instanceof Constructor) || (forbiddenField !== undefined && forbiddenField in it)) {
                throw TypeError(name + ': incorrect invocation!');
            }
            return it;
        };


        /***/
    }),
    /* 251 */
    /***/
    (function(module, exports, __webpack_require__) {

        var ctx = __webpack_require__(29);
        var call = __webpack_require__(213);
        var isArrayIter = __webpack_require__(214);
        var anObject = __webpack_require__(11);
        var toLength = __webpack_require__(37);
        var getIterFn = __webpack_require__(215);
        var BREAK = {};
        var RETURN = {};
        var exports = module.exports = function(iterable, entries, fn, that, ITERATOR) {
            var iterFn = ITERATOR ? function() { return iterable; } : getIterFn(iterable);
            var f = ctx(fn, that, entries ? 2 : 1);
            var index = 0;
            var length, step, iterator, result;
            if (typeof iterFn != 'function') throw TypeError(iterable + ' is not iterable!');
            // fast case for arrays with default iterator
            if (isArrayIter(iterFn))
                for (length = toLength(iterable.length); length > index; index++) {
                    result = entries ? f(anObject(step = iterable[index])[0], step[1]) : f(iterable[index]);
                    if (result === BREAK || result === RETURN) return result;
                } else
                    for (iterator = iterFn.call(iterable); !(step = iterator.next()).done;) {
                        result = call(iterator, f, step.value, entries);
                        if (result === BREAK || result === RETURN) return result;
                    }
        };
        exports.BREAK = BREAK;
        exports.RETURN = RETURN;


        /***/
    }),
    /* 252 */
    /***/
    (function(module, exports) {

        // fast apply, http://jsperf.lnkit.com/fast-apply/5
        module.exports = function(fn, args, that) {
            var un = that === undefined;
            switch (args.length) {
                case 0:
                    return un ? fn() :
                        fn.call(that);
                case 1:
                    return un ? fn(args[0]) :
                        fn.call(that, args[0]);
                case 2:
                    return un ? fn(args[0], args[1]) :
                        fn.call(that, args[0], args[1]);
                case 3:
                    return un ? fn(args[0], args[1], args[2]) :
                        fn.call(that, args[0], args[1], args[2]);
                case 4:
                    return un ? fn(args[0], args[1], args[2], args[3]) :
                        fn.call(that, args[0], args[1], args[2], args[3]);
            }
            return fn.apply(that, args);
        };


        /***/
    }),
    /* 253 */
    /***/
    (function(module, exports, __webpack_require__) {

        var global = __webpack_require__(0);
        var macrotask = __webpack_require__(227).set;
        var Observer = global.MutationObserver || global.WebKitMutationObserver;
        var process = global.process;
        var Promise = global.Promise;
        var isNode = __webpack_require__(23)(process) == 'process';

        module.exports = function() {
            var head, last, notify;

            var flush = function() {
                var parent, fn;
                if (isNode && (parent = process.domain)) parent.exit();
                while (head) {
                    fn = head.fn;
                    head = head.next;
                    try {
                        fn();
                    } catch (e) {
                        if (head) notify();
                        else last = undefined;
                        throw e;
                    }
                }
                last = undefined;
                if (parent) parent.enter();
            };

            // Node.js
            if (isNode) {
                notify = function() {
                    process.nextTick(flush);
                };
                // browsers with MutationObserver
            } else if (Observer) {
                var toggle = true;
                var node = document.createTextNode('');
                new Observer(flush).observe(node, { characterData: true }); // eslint-disable-line no-new
                notify = function() {
                    node.data = toggle = !toggle;
                };
                // environments with maybe non-completely correct, but existent Promise
            } else if (Promise && Promise.resolve) {
                var promise = Promise.resolve();
                notify = function() {
                    promise.then(flush);
                };
                // for other environments - macrotask based on:
                // - setImmediate
                // - MessageChannel
                // - window.postMessag
                // - onreadystatechange
                // - setTimeout
            } else {
                notify = function() {
                    // strange IE + webpack dev server bug - use .call(global)
                    macrotask.call(global, flush);
                };
            }

            return function(fn) {
                var task = { fn: fn, next: undefined };
                if (last) last.next = task;
                if (!head) {
                    head = task;
                    notify();
                }
                last = task;
            };
        };


        /***/
    }),
    /* 254 */
    /***/
    (function(module, exports, __webpack_require__) {

        var hide = __webpack_require__(7);
        module.exports = function(target, src, safe) {
            for (var key in src) {
                if (safe && target[key]) target[key] = src[key];
                else hide(target, key, src[key]);
            }
            return target;
        };


        /***/
    }),
    /* 255 */
    /***/
    (function(module, exports, __webpack_require__) {

        "use strict";

        var global = __webpack_require__(0);
        var core = __webpack_require__(1);
        var dP = __webpack_require__(3);
        var DESCRIPTORS = __webpack_require__(2);
        var SPECIES = __webpack_require__(4)('species');

        module.exports = function(KEY) {
            var C = typeof core[KEY] == 'function' ? core[KEY] : global[KEY];
            if (DESCRIPTORS && C && !C[SPECIES]) dP.f(C, SPECIES, {
                configurable: true,
                get: function() { return this; }
            });
        };


        /***/
    }),
    /* 256 */
    /***/
    (function(module, exports, __webpack_require__) {

        "use strict";
        // https://github.com/tc39/proposal-promise-finally

        var $export = __webpack_require__(10);
        var core = __webpack_require__(1);
        var global = __webpack_require__(0);
        var speciesConstructor = __webpack_require__(226);
        var promiseResolve = __webpack_require__(229);

        $export($export.P + $export.R, 'Promise', {
            'finally': function(onFinally) {
                var C = speciesConstructor(this, core.Promise || global.Promise);
                var isFunction = typeof onFinally == 'function';
                return this.then(
                    isFunction ? function(x) {
                        return promiseResolve(C, onFinally()).then(function() { return x; });
                    } : onFinally,
                    isFunction ? function(e) {
                        return promiseResolve(C, onFinally()).then(function() { throw e; });
                    } : onFinally
                );
            }
        });


        /***/
    }),
    /* 257 */
    /***/
    (function(module, exports, __webpack_require__) {

        "use strict";

        // https://github.com/tc39/proposal-promise-try
        var $export = __webpack_require__(10);
        var newPromiseCapability = __webpack_require__(216);
        var perform = __webpack_require__(228);

        $export($export.S, 'Promise', {
            'try': function(callbackfn) {
                var promiseCapability = newPromiseCapability.f(this);
                var result = perform(callbackfn);
                (result.e ? promiseCapability.reject : promiseCapability.resolve)(result.v);
                return promiseCapability.promise;
            }
        });


        /***/
    }),
    /* 258 */
    /***/
    (function(module, exports, __webpack_require__) {

        __webpack_require__(259);
        var $Object = __webpack_require__(1).Object;
        module.exports = function create(P, D) {
            return $Object.create(P, D);
        };


        /***/
    }),
    /* 259 */
    /***/
    (function(module, exports, __webpack_require__) {

        var $export = __webpack_require__(10);
        // 19.1.2.2 / 15.2.3.5 Object.create(O [, Properties])
        $export($export.S, 'Object', { create: __webpack_require__(42) });


        /***/
    }),
    /* 260 */
    /***/
    (function(module, exports, __webpack_require__) {

        var Symbol = __webpack_require__(205);

        /** Used for built-in method references. */
        var objectProto = Object.prototype;

        /** Used to check objects for own properties. */
        var hasOwnProperty = objectProto.hasOwnProperty;

        /**
         * Used to resolve the
         * [`toStringTag`](http://ecma-international.org/ecma-262/7.0/#sec-object.prototype.tostring)
         * of values.
         */
        var nativeObjectToString = objectProto.toString;

        /** Built-in value references. */
        var symToStringTag = Symbol ? Symbol.toStringTag : undefined;

        /**
         * A specialized version of `baseGetTag` which ignores `Symbol.toStringTag` values.
         *
         * @private
         * @param {*} value The value to query.
         * @returns {string} Returns the raw `toStringTag`.
         */
        function getRawTag(value) {
            var isOwn = hasOwnProperty.call(value, symToStringTag),
                tag = value[symToStringTag];

            try {
                value[symToStringTag] = undefined;
                var unmasked = true;
            } catch (e) {}

            var result = nativeObjectToString.call(value);
            if (unmasked) {
                if (isOwn) {
                    value[symToStringTag] = tag;
                } else {
                    delete value[symToStringTag];
                }
            }
            return result;
        }

        module.exports = getRawTag;


        /***/
    }),
    /* 261 */
    /***/
    (function(module, exports) {

        /** Used for built-in method references. */
        var objectProto = Object.prototype;

        /**
         * Used to resolve the
         * [`toStringTag`](http://ecma-international.org/ecma-262/7.0/#sec-object.prototype.tostring)
         * of values.
         */
        var nativeObjectToString = objectProto.toString;

        /**
         * Converts `value` to a string using `Object.prototype.toString`.
         *
         * @private
         * @param {*} value The value to convert.
         * @returns {string} Returns the converted string.
         */
        function objectToString(value) {
            return nativeObjectToString.call(value);
        }

        module.exports = objectToString;


        /***/
    }),
    /* 262 */
    /***/
    (function(module, exports, __webpack_require__) {

        "use strict";


        var _promise = __webpack_require__(53);

        var _promise2 = _interopRequireDefault(_promise);

        var _create = __webpack_require__(49);

        var _create2 = _interopRequireDefault(_create);

        var _isFunction2 = __webpack_require__(50);

        var _isFunction3 = _interopRequireDefault(_isFunction2);

        var _isObject2 = __webpack_require__(202);

        var _isObject3 = _interopRequireDefault(_isObject2);

        function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

        var modal = weex.requireModule('bmModal'),
            Notice = (0, _create2.default)(null);

        Notice.install = function(Vue, options) {
            Vue.prototype.$notice = {
                alert: function alert(options) {
                    if (options.message) {
                        return new _promise2.default(function(resolve, reject) {
                            modal.alert({
                                // titleAlign: options.titleAlign || 'center',
                                title: options.title || '',
                                message: options.message || '',
                                // messageAlign: options.messageAlign || 'center',
                                okTitle: options.okTitle || '确定'
                            }, function(params) {
                                if ((0, _isFunction3.default)(options.callback)) {
                                    options.callback.call(params);
                                }
                                resolve();
                            });
                        });
                    }
                },
                confirm: function confirm(options) {
                    if (options.message) {
                        return new _promise2.default(function(resolve, reject) {
                            modal.confirm({
                                // titleAlign: options.titleAlign || 'center',
                                title: options.title || '',
                                message: options.message || '',
                                // messageAlign: options.messageAlign || 'center',
                                cancelTitle: options.cancelTitle || '取消',
                                okTitle: options.okTitle || '确定'
                            }, function(params) {
                                if ((0, _isFunction3.default)(options.cancelCallback)) {
                                    options.cancelCallback.call(params);
                                }
                                reject();
                            }, function(params) {
                                if ((0, _isFunction3.default)(options.okCallback)) {
                                    options.okCallback.call(params);
                                }
                                resolve();
                            });
                        });
                    }
                },

                loading: {
                    show: function show() {
                        var message = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : '';

                        modal.showLoading({ message: message });
                    },
                    hide: function hide() {
                        setTimeout(function() {
                            modal.hideLoading();
                        }, 200);
                    }
                },
                toast: function toast(options) {
                    if (!options) return;
                    if ((0, _isObject3.default)(options)) {
                        modal.toast({
                            message: options.message
                        });
                    } else {
                        modal.toast({
                            message: options
                        });
                    }
                }
            };
        };

        Vue.use(Notice);

        /***/
    }),
    /* 263 */
    /***/
    (function(module, exports, __webpack_require__) {

        "use strict";


        Object.defineProperty(exports, "__esModule", {
            value: true
        });
        exports.DEFAULT_ANIMATETYPE = undefined;

        var _stringify = __webpack_require__(51);

        var _stringify2 = _interopRequireDefault(_stringify);

        var _promise = __webpack_require__(53);

        var _promise2 = _interopRequireDefault(_promise);

        var _isEmpty = __webpack_require__(218);

        var _isEmpty2 = _interopRequireDefault(_isEmpty);

        var _isFunction = __webpack_require__(50);

        var _isFunction2 = _interopRequireDefault(_isFunction);

        var _isUndefined2 = __webpack_require__(279);

        var _isUndefined3 = _interopRequireDefault(_isUndefined2);

        var _isPlainObject = __webpack_require__(280);

        var _isPlainObject2 = _interopRequireDefault(_isPlainObject);

        function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

        /**
         * @Author: songqi
         * @Date:   2017-01-11
         * @Last modified by:   songqi
         * @Last modified time: 2017-04-05
         */

        var modal = weex.requireModule('bmModal'),
            router = weex.requireModule('bmRouter'),
            storage = weex.requireModule('bmStorage'),
            globalEvent = weex.requireModule('globalEvent');

        // 客户端默认打开页面的动画
        var DEFAULT_ANIMATETYPE = exports.DEFAULT_ANIMATETYPE = 'PUSH';

        var Router = {
            // 页面将要出现
            viewWillAppear: [],
            // 页面已经出现
            viewDidAppear: [],
            // 页面被拿出栈时即将展示
            viewWillBackAppear: [],
            // 页面被拿出栈时已经展示
            viewDidBackAppear: [],
            // 页面将要放在栈中
            viewWillDisappear: [],
            // 页面已经放在栈中
            viewDidDisappear: []
        };

        globalEvent.addEventListener("viewWillAppear", function(options) {
            if (options.type === 'open' || options.type === 'refresh') {
                router.getParams(function(params) {
                    Router.viewWillAppear.map(function(item) {
                        item(params, options);
                    });
                });
            } else if (options.type === 'back') {
                storage.getData('router.backParams', function(resData) {
                    Router.viewWillBackAppear.map(function(item) {
                        item(JSON.parse(resData.data.value || '{}'), options);
                    });
                });
            }
        });

        globalEvent.addEventListener("viewDidAppear", function(options) {
            if (options.type === 'open' || options.type === 'refresh') {
                router.getParams(function(params) {
                    Router.viewDidAppear.map(function(item) {
                        item(params, options);
                    });
                });
            } else if (options.type === 'back') {
                storage.getData('router.backParams', function(resData) {
                    Router.viewDidBackAppear.map(function(item) {
                        item(JSON.parse(resData.data.value || '{}'), options);
                    });
                    storage.deleteData('router.backParams');
                });
            }
        });

        globalEvent.addEventListener("viewWillDisappear", function(options) {
            modal.hideLoading();
            Router.viewWillDisappear.map(function(item) {
                item(options);
            });
        });

        globalEvent.addEventListener("viewDidDisappear", function(options) {
            Router.viewDidDisappear.map(function(item) {
                item(options);
            });
        });

        // todo 修改逻辑
        Router.install = function(Vue, options) {
            Vue.mixin({
                beforeCreate: function beforeCreate() {
                    if (this.$options.bmRouter) {
                        var bmRouter = this.$options.bmRouter;
                        for (var i in bmRouter) {
                            if (!Router[i]) {
                                Router[i] = [];
                            }
                            Router[i].push(bmRouter[i].bind(this));
                        }
                    }
                }
            });
            Vue.prototype.$router = {
                open: function open(options) {
                    var _this = this;

                    options = options || {};
                    var currentPageInfo = this.getUrl(options.name);
                    if (!currentPageInfo || !currentPageInfo.url) return;

                    return new _promise2.default(function(resolve, reject) {
                        router.open({
                            url: currentPageInfo.url,
                            type: options.type || currentPageInfo.type || 'PUSH',
                            params: options.params || {},
                            canBack: options.canBack || (0, _isUndefined3.default)(currentPageInfo.canBack) ? true : currentPageInfo.canBack,
                            navShow: (0, _isUndefined3.default)(currentPageInfo.navShow) ? true : currentPageInfo.navShow,
                            navTitle: currentPageInfo.navTitle,
                            statusBarStyle: currentPageInfo.statusBarStyle || 'Default',
                            isRunBackCallback: (0, _isFunction2.default)(options.backCallback)
                        }, function(data) {
                            if ((0, _isFunction2.default)(options.backCallback)) {
                                options.backCallback.call(_this, data);
                            }
                        });
                    });
                },
                back: function back(options) {
                    var _this2 = this;

                    options = options || {};
                    return new _promise2.default(function(resolve, reject) {
                        router.back({
                            length: options.length || 1
                        }, function(data) {
                            if ((0, _isFunction2.default)(options.callback)) {
                                options.callback.call(_this2, data);
                            }
                            resolve(data);
                        });
                    });
                },
                getParams: function getParams(callback) {
                    var _this3 = this;

                    return new _promise2.default(function(resolve, reject) {
                        router.getParams(function(params) {
                            if ((0, _isFunction2.default)(callback)) {
                                callback.call(_this3, params);
                            }
                            resolve(params);
                        });
                    });
                },
                getUrl: function getUrl(page) {
                    var currentPageInfo = Vue.prototype.eros.routes[page];
                    if (!currentPageInfo) {
                        modal.alert({
                            message: '跳转页面不存在',
                            okTitle: '确定'
                        });
                        return false;
                    }
                    return currentPageInfo;
                },
                refresh: function refresh() {
                    router.refreshWeex();
                },
                setBackParams: function setBackParams(params) {
                    if ((0, _isPlainObject2.default)(params)) {
                        storage.setData('router.backParams', (0, _stringify2.default)(params));
                    }
                },
                toWebView: function toWebView(params) {
                    if (!params.url) {
                        return;
                    }
                    params.title = params.title || 'weex-eros';
                    // params.shareInfo = {
                    //     title: params.shareTitle,
                    //     content: params.content || '',
                    //     image: params.image || '',
                    //     url: params.url || '',
                    //     platforms: params.platforms || [] // 传空的话默认全部
                    // }
                    if (params.shareInfo) {
                        !params.shareInfo.image && (params.shareInfo.image = 'https://img.benmu-health.com/wechat/jyt100.png');
                    }

                    router.toWebView(params);
                },
                toMap: function toMap(options) {
                    // options = {
                    //     type:'NAVIGATION', //type类型：NAVIGATION(表现方式为：地图上添加起点终点标示大头针，终点标示上面有个导航的按钮)
                    //     title: '页面标题', //页面标题
                    //     navigationInfo: {
                    //         title: '北京朝阳医院', //目的地名称
                    //         address: '北京市朝阳区工体南路8号', //目的地地址
                    //         longitude:'', //目的地经度
                    //         latitude:'' //目的地纬度
                    //      }
                    // }
                    router.toMap(options);
                },
                toCallPhone: function toCallPhone(phone) {
                    if (phone) {
                        router.callPhone({
                            phone: phone
                        });
                    }
                }
            };
        };

        Vue.use(Router);

        /***/
    }),
    /* 264 */
    /***/
    (function(module, exports, __webpack_require__) {

        var overArg = __webpack_require__(232);

        /* Built-in method references for those with the same name as other `lodash` methods. */
        var nativeKeys = overArg(Object.keys, Object);

        module.exports = nativeKeys;


        /***/
    }),
    /* 265 */
    /***/
    (function(module, exports, __webpack_require__) {

        var DataView = __webpack_require__(266),
            Map = __webpack_require__(234),
            Promise = __webpack_require__(271),
            Set = __webpack_require__(272),
            WeakMap = __webpack_require__(273),
            baseGetTag = __webpack_require__(98),
            toSource = __webpack_require__(233);

        /** `Object#toString` result references. */
        var mapTag = '[object Map]',
            objectTag = '[object Object]',
            promiseTag = '[object Promise]',
            setTag = '[object Set]',
            weakMapTag = '[object WeakMap]';

        var dataViewTag = '[object DataView]';

        /** Used to detect maps, sets, and weakmaps. */
        var dataViewCtorString = toSource(DataView),
            mapCtorString = toSource(Map),
            promiseCtorString = toSource(Promise),
            setCtorString = toSource(Set),
            weakMapCtorString = toSource(WeakMap);

        /**
         * Gets the `toStringTag` of `value`.
         *
         * @private
         * @param {*} value The value to query.
         * @returns {string} Returns the `toStringTag`.
         */
        var getTag = baseGetTag;

        // Fallback for data views, maps, sets, and weak maps in IE 11 and promises in Node.js < 6.
        if ((DataView && getTag(new DataView(new ArrayBuffer(1))) != dataViewTag) ||
            (Map && getTag(new Map) != mapTag) ||
            (Promise && getTag(Promise.resolve()) != promiseTag) ||
            (Set && getTag(new Set) != setTag) ||
            (WeakMap && getTag(new WeakMap) != weakMapTag)) {
            getTag = function(value) {
                var result = baseGetTag(value),
                    Ctor = result == objectTag ? value.constructor : undefined,
                    ctorString = Ctor ? toSource(Ctor) : '';

                if (ctorString) {
                    switch (ctorString) {
                        case dataViewCtorString:
                            return dataViewTag;
                        case mapCtorString:
                            return mapTag;
                        case promiseCtorString:
                            return promiseTag;
                        case setCtorString:
                            return setTag;
                        case weakMapCtorString:
                            return weakMapTag;
                    }
                }
                return result;
            };
        }

        module.exports = getTag;


        /***/
    }),
    /* 266 */
    /***/
    (function(module, exports, __webpack_require__) {

        var getNative = __webpack_require__(81),
            root = __webpack_require__(69);

        /* Built-in method references that are verified to be native. */
        var DataView = getNative(root, 'DataView');

        module.exports = DataView;


        /***/
    }),
    /* 267 */
    /***/
    (function(module, exports, __webpack_require__) {

        var isFunction = __webpack_require__(50),
            isMasked = __webpack_require__(268),
            isObject = __webpack_require__(202),
            toSource = __webpack_require__(233);

        /**
         * Used to match `RegExp`
         * [syntax characters](http://ecma-international.org/ecma-262/7.0/#sec-patterns).
         */
        var reRegExpChar = /[\\^$.*+?()[\]{}|]/g;

        /** Used to detect host constructors (Safari). */
        var reIsHostCtor = /^\[object .+?Constructor\]$/;

        /** Used for built-in method references. */
        var funcProto = Function.prototype,
            objectProto = Object.prototype;

        /** Used to resolve the decompiled source of functions. */
        var funcToString = funcProto.toString;

        /** Used to check objects for own properties. */
        var hasOwnProperty = objectProto.hasOwnProperty;

        /** Used to detect if a method is native. */
        var reIsNative = RegExp('^' +
            funcToString.call(hasOwnProperty).replace(reRegExpChar, '\\$&')
            .replace(/hasOwnProperty|(function).*?(?=\\\()| for .+?(?=\\\])/g, '$1.*?') + '$'
        );

        /**
         * The base implementation of `_.isNative` without bad shim checks.
         *
         * @private
         * @param {*} value The value to check.
         * @returns {boolean} Returns `true` if `value` is a native function,
         *  else `false`.
         */
        function baseIsNative(value) {
            if (!isObject(value) || isMasked(value)) {
                return false;
            }
            var pattern = isFunction(value) ? reIsNative : reIsHostCtor;
            return pattern.test(toSource(value));
        }

        module.exports = baseIsNative;


        /***/
    }),
    /* 268 */
    /***/
    (function(module, exports, __webpack_require__) {

        var coreJsData = __webpack_require__(269);

        /** Used to detect methods masquerading as native. */
        var maskSrcKey = (function() {
            var uid = /[^.]+$/.exec(coreJsData && coreJsData.keys && coreJsData.keys.IE_PROTO || '');
            return uid ? ('Symbol(src)_1.' + uid) : '';
        }());

        /**
         * Checks if `func` has its source masked.
         *
         * @private
         * @param {Function} func The function to check.
         * @returns {boolean} Returns `true` if `func` is masked, else `false`.
         */
        function isMasked(func) {
            return !!maskSrcKey && (maskSrcKey in func);
        }

        module.exports = isMasked;


        /***/
    }),
    /* 269 */
    /***/
    (function(module, exports, __webpack_require__) {

        var root = __webpack_require__(69);

        /** Used to detect overreaching core-js shims. */
        var coreJsData = root['__core-js_shared__'];

        module.exports = coreJsData;


        /***/
    }),
    /* 270 */
    /***/
    (function(module, exports) {

        /**
         * Gets the value at `key` of `object`.
         *
         * @private
         * @param {Object} [object] The object to query.
         * @param {string} key The key of the property to get.
         * @returns {*} Returns the property value.
         */
        function getValue(object, key) {
            return object == null ? undefined : object[key];
        }

        module.exports = getValue;


        /***/
    }),
    /* 271 */
    /***/
    (function(module, exports, __webpack_require__) {

        var getNative = __webpack_require__(81),
            root = __webpack_require__(69);

        /* Built-in method references that are verified to be native. */
        var Promise = getNative(root, 'Promise');

        module.exports = Promise;


        /***/
    }),
    /* 272 */
    /***/
    (function(module, exports, __webpack_require__) {

        var getNative = __webpack_require__(81),
            root = __webpack_require__(69);

        /* Built-in method references that are verified to be native. */
        var Set = getNative(root, 'Set');

        module.exports = Set;


        /***/
    }),
    /* 273 */
    /***/
    (function(module, exports, __webpack_require__) {

        var getNative = __webpack_require__(81),
            root = __webpack_require__(69);

        /* Built-in method references that are verified to be native. */
        var WeakMap = getNative(root, 'WeakMap');

        module.exports = WeakMap;


        /***/
    }),
    /* 274 */
    /***/
    (function(module, exports, __webpack_require__) {

        var baseGetTag = __webpack_require__(98),
            isObjectLike = __webpack_require__(203);

        /** `Object#toString` result references. */
        var argsTag = '[object Arguments]';

        /**
         * The base implementation of `_.isArguments`.
         *
         * @private
         * @param {*} value The value to check.
         * @returns {boolean} Returns `true` if `value` is an `arguments` object,
         */
        function baseIsArguments(value) {
            return isObjectLike(value) && baseGetTag(value) == argsTag;
        }

        module.exports = baseIsArguments;


        /***/
    }),
    /* 275 */
    /***/
    (function(module, exports) {

        /**
         * This method returns `false`.
         *
         * @static
         * @memberOf _
         * @since 4.13.0
         * @category Util
         * @returns {boolean} Returns `false`.
         * @example
         *
         * _.times(2, _.stubFalse);
         * // => [false, false]
         */
        function stubFalse() {
            return false;
        }

        module.exports = stubFalse;


        /***/
    }),
    /* 276 */
    /***/
    (function(module, exports, __webpack_require__) {

        var baseGetTag = __webpack_require__(98),
            isLength = __webpack_require__(220),
            isObjectLike = __webpack_require__(203);

        /** `Object#toString` result references. */
        var argsTag = '[object Arguments]',
            arrayTag = '[object Array]',
            boolTag = '[object Boolean]',
            dateTag = '[object Date]',
            errorTag = '[object Error]',
            funcTag = '[object Function]',
            mapTag = '[object Map]',
            numberTag = '[object Number]',
            objectTag = '[object Object]',
            regexpTag = '[object RegExp]',
            setTag = '[object Set]',
            stringTag = '[object String]',
            weakMapTag = '[object WeakMap]';

        var arrayBufferTag = '[object ArrayBuffer]',
            dataViewTag = '[object DataView]',
            float32Tag = '[object Float32Array]',
            float64Tag = '[object Float64Array]',
            int8Tag = '[object Int8Array]',
            int16Tag = '[object Int16Array]',
            int32Tag = '[object Int32Array]',
            uint8Tag = '[object Uint8Array]',
            uint8ClampedTag = '[object Uint8ClampedArray]',
            uint16Tag = '[object Uint16Array]',
            uint32Tag = '[object Uint32Array]';

        /** Used to identify `toStringTag` values of typed arrays. */
        var typedArrayTags = {};
        typedArrayTags[float32Tag] = typedArrayTags[float64Tag] =
            typedArrayTags[int8Tag] = typedArrayTags[int16Tag] =
            typedArrayTags[int32Tag] = typedArrayTags[uint8Tag] =
            typedArrayTags[uint8ClampedTag] = typedArrayTags[uint16Tag] =
            typedArrayTags[uint32Tag] = true;
        typedArrayTags[argsTag] = typedArrayTags[arrayTag] =
            typedArrayTags[arrayBufferTag] = typedArrayTags[boolTag] =
            typedArrayTags[dataViewTag] = typedArrayTags[dateTag] =
            typedArrayTags[errorTag] = typedArrayTags[funcTag] =
            typedArrayTags[mapTag] = typedArrayTags[numberTag] =
            typedArrayTags[objectTag] = typedArrayTags[regexpTag] =
            typedArrayTags[setTag] = typedArrayTags[stringTag] =
            typedArrayTags[weakMapTag] = false;

        /**
         * The base implementation of `_.isTypedArray` without Node.js optimizations.
         *
         * @private
         * @param {*} value The value to check.
         * @returns {boolean} Returns `true` if `value` is a typed array, else `false`.
         */
        function baseIsTypedArray(value) {
            return isObjectLike(value) &&
                isLength(value.length) && !!typedArrayTags[baseGetTag(value)];
        }

        module.exports = baseIsTypedArray;


        /***/
    }),
    /* 277 */
    /***/
    (function(module, exports) {

        /**
         * The base implementation of `_.unary` without support for storing metadata.
         *
         * @private
         * @param {Function} func The function to cap arguments for.
         * @returns {Function} Returns the new capped function.
         */
        function baseUnary(func) {
            return function(value) {
                return func(value);
            };
        }

        module.exports = baseUnary;


        /***/
    }),
    /* 278 */
    /***/
    (function(module, exports, __webpack_require__) {

        /* WEBPACK VAR INJECTION */
        (function(module) {
            var freeGlobal = __webpack_require__(230);

            /** Detect free variable `exports`. */
            var freeExports = typeof exports == 'object' && exports && !exports.nodeType && exports;

            /** Detect free variable `module`. */
            var freeModule = freeExports && typeof module == 'object' && module && !module.nodeType && module;

            /** Detect the popular CommonJS extension `module.exports`. */
            var moduleExports = freeModule && freeModule.exports === freeExports;

            /** Detect free variable `process` from Node.js. */
            var freeProcess = moduleExports && freeGlobal.process;

            /** Used to access faster Node.js helpers. */
            var nodeUtil = (function() {
                try {
                    return freeProcess && freeProcess.binding && freeProcess.binding('util');
                } catch (e) {}
            }());

            module.exports = nodeUtil;

            /* WEBPACK VAR INJECTION */
        }.call(exports, __webpack_require__(65)(module)))

        /***/
    }),
    /* 279 */
    /***/
    (function(module, exports) {

        /**
         * Checks if `value` is `undefined`.
         *
         * @static
         * @since 0.1.0
         * @memberOf _
         * @category Lang
         * @param {*} value The value to check.
         * @returns {boolean} Returns `true` if `value` is `undefined`, else `false`.
         * @example
         *
         * _.isUndefined(void 0);
         * // => true
         *
         * _.isUndefined(null);
         * // => false
         */
        function isUndefined(value) {
            return value === undefined;
        }

        module.exports = isUndefined;


        /***/
    }),
    /* 280 */
    /***/
    (function(module, exports, __webpack_require__) {

        var baseGetTag = __webpack_require__(98),
            getPrototype = __webpack_require__(281),
            isObjectLike = __webpack_require__(203);

        /** `Object#toString` result references. */
        var objectTag = '[object Object]';

        /** Used for built-in method references. */
        var funcProto = Function.prototype,
            objectProto = Object.prototype;

        /** Used to resolve the decompiled source of functions. */
        var funcToString = funcProto.toString;

        /** Used to check objects for own properties. */
        var hasOwnProperty = objectProto.hasOwnProperty;

        /** Used to infer the `Object` constructor. */
        var objectCtorString = funcToString.call(Object);

        /**
         * Checks if `value` is a plain object, that is, an object created by the
         * `Object` constructor or one with a `[[Prototype]]` of `null`.
         *
         * @static
         * @memberOf _
         * @since 0.8.0
         * @category Lang
         * @param {*} value The value to check.
         * @returns {boolean} Returns `true` if `value` is a plain object, else `false`.
         * @example
         *
         * function Foo() {
         *   this.a = 1;
         * }
         *
         * _.isPlainObject(new Foo);
         * // => false
         *
         * _.isPlainObject([1, 2, 3]);
         * // => false
         *
         * _.isPlainObject({ 'x': 0, 'y': 0 });
         * // => true
         *
         * _.isPlainObject(Object.create(null));
         * // => true
         */
        function isPlainObject(value) {
            if (!isObjectLike(value) || baseGetTag(value) != objectTag) {
                return false;
            }
            var proto = getPrototype(value);
            if (proto === null) {
                return true;
            }
            var Ctor = hasOwnProperty.call(proto, 'constructor') && proto.constructor;
            return typeof Ctor == 'function' && Ctor instanceof Ctor &&
                funcToString.call(Ctor) == objectCtorString;
        }

        module.exports = isPlainObject;


        /***/
    }),
    /* 281 */
    /***/
    (function(module, exports, __webpack_require__) {

        var overArg = __webpack_require__(232);

        /** Built-in value references. */
        var getPrototype = overArg(Object.getPrototypeOf, Object);

        module.exports = getPrototype;


        /***/
    }),
    /* 282 */
    /***/
    (function(module, exports, __webpack_require__) {

        "use strict";


        var _keys = __webpack_require__(225);

        var _keys2 = _interopRequireDefault(_keys);

        var _promise = __webpack_require__(53);

        var _promise2 = _interopRequireDefault(_promise);

        var _create = __webpack_require__(49);

        var _create2 = _interopRequireDefault(_create);

        var _pick2 = __webpack_require__(283);

        var _pick3 = _interopRequireDefault(_pick2);

        var _assign2 = __webpack_require__(326);

        var _assign3 = _interopRequireDefault(_assign2);

        var _isEmpty2 = __webpack_require__(218);

        var _isEmpty3 = _interopRequireDefault(_isEmpty2);

        var _tools = __webpack_require__(334);

        function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

        /**
         * @Author: songqi
         * @Date:   2017-01-11
         * @Last modified by:   songqi
         * @Last modified time: 2017-05-08
         */

        var bmAxios = weex.requireModule('bmAxios'),
            Axios = (0, _create2.default)(null);

        var MOCK_PREFIX = weex.config.env.jsServer;
        var TRUE_PREFIX = weex.config.env.request;

        Axios.install = function(Vue, options) {
            Vue.prototype.$fetch = function(options) {
                // 不仅支持 success, error 的回调写法，还支持 promise 的写法
                return new _promise2.default(function(resolve, reject) {
                    bmAxios.fetch({
                        method: options.method || 'GET',
                        url: options.url,
                        header: options.header || {},
                        data: options.data || {}
                    }, function(resData) {
                        // 可以做统一的监控
                        Vue.prototype.eros.responseHandler(options, resData, resolve, reject);
                    });
                });
            }, Vue.prototype.$service = function(name, params, options) {
                var AJAX_MAP = Vue.prototype.eros.ajaxMap;
                // 不仅支持 success, error 的回调写法，还支持 promise 的写法
                (0, _tools.assert)(AJAX_MAP[name], 'axios--->service层中并没有此命名的方法');
                var _params = AJAX_MAP[name]['params'],
                    openMock = Vue.prototype.eros.switchs.mock;

                return new _promise2.default(function(resolve, reject) {
                    bmAxios.fetch({
                        method: AJAX_MAP[name]['method'] || 'GET',
                        url: openMock ? MOCK_PREFIX + AJAX_MAP[name]['mockPath'] : TRUE_PREFIX + AJAX_MAP[name]['truePath'],
                        header: AJAX_MAP[name]['header'] || {},
                        data: (0, _isEmpty3.default)(params) ? _params : (0, _pick3.default)((0, _assign3.default)({}, _params, params), (0, _keys2.default)(_params))
                    }, function(resData) {
                        // 可以做统一的监控
                        Vue.prototype.eros.responseHandler(options, resData, resolve, reject);
                    });
                });
            };
        };

        Vue.use(Axios);

        /***/
    }),
    /* 283 */
    /***/
    (function(module, exports, __webpack_require__) {

        var basePick = __webpack_require__(284),
            flatRest = __webpack_require__(317);

        /**
         * Creates an object composed of the picked `object` properties.
         *
         * @static
         * @since 0.1.0
         * @memberOf _
         * @category Object
         * @param {Object} object The source object.
         * @param {...(string|string[])} [paths] The property paths to pick.
         * @returns {Object} Returns the new object.
         * @example
         *
         * var object = { 'a': 1, 'b': '2', 'c': 3 };
         *
         * _.pick(object, ['a', 'c']);
         * // => { 'a': 1, 'c': 3 }
         */
        var pick = flatRest(function(object, paths) {
            return object == null ? {} : basePick(object, paths);
        });

        module.exports = pick;


        /***/
    }),
    /* 284 */
    /***/
    (function(module, exports, __webpack_require__) {

        var basePickBy = __webpack_require__(285),
            hasIn = __webpack_require__(314);

        /**
         * The base implementation of `_.pick` without support for individual
         * property identifiers.
         *
         * @private
         * @param {Object} object The source object.
         * @param {string[]} paths The property paths to pick.
         * @returns {Object} Returns the new object.
         */
        function basePick(object, paths) {
            return basePickBy(object, paths, function(value, path) {
                return hasIn(object, path);
            });
        }

        module.exports = basePick;


        /***/
    }),
    /* 285 */
    /***/
    (function(module, exports, __webpack_require__) {

        var baseGet = __webpack_require__(286),
            baseSet = __webpack_require__(313),
            castPath = __webpack_require__(208);

        /**
         * The base implementation of  `_.pickBy` without support for iteratee shorthands.
         *
         * @private
         * @param {Object} object The source object.
         * @param {string[]} paths The property paths to pick.
         * @param {Function} predicate The function invoked per property.
         * @returns {Object} Returns the new object.
         */
        function basePickBy(object, paths, predicate) {
            var index = -1,
                length = paths.length,
                result = {};

            while (++index < length) {
                var path = paths[index],
                    value = baseGet(object, path);

                if (predicate(value, path)) {
                    baseSet(result, castPath(path, object), value);
                }
            }
            return result;
        }

        module.exports = basePickBy;


        /***/
    }),
    /* 286 */
    /***/
    (function(module, exports, __webpack_require__) {

        var castPath = __webpack_require__(208),
            toKey = __webpack_require__(223);

        /**
         * The base implementation of `_.get` without support for default values.
         *
         * @private
         * @param {Object} object The object to query.
         * @param {Array|string} path The path of the property to get.
         * @returns {*} Returns the resolved value.
         */
        function baseGet(object, path) {
            path = castPath(path, object);

            var index = 0,
                length = path.length;

            while (object != null && index < length) {
                object = object[toKey(path[index++])];
            }
            return (index && index == length) ? object : undefined;
        }

        module.exports = baseGet;


        /***/
    }),
    /* 287 */
    /***/
    (function(module, exports, __webpack_require__) {

        var isArray = __webpack_require__(70),
            isSymbol = __webpack_require__(221);

        /** Used to match property names within property paths. */
        var reIsDeepProp = /\.|\[(?:[^[\]]*|(["'])(?:(?!\1)[^\\]|\\.)*?\1)\]/,
            reIsPlainProp = /^\w*$/;

        /**
         * Checks if `value` is a property name and not a property path.
         *
         * @private
         * @param {*} value The value to check.
         * @param {Object} [object] The object to query keys on.
         * @returns {boolean} Returns `true` if `value` is a property name, else `false`.
         */
        function isKey(value, object) {
            if (isArray(value)) {
                return false;
            }
            var type = typeof value;
            if (type == 'number' || type == 'symbol' || type == 'boolean' ||
                value == null || isSymbol(value)) {
                return true;
            }
            return reIsPlainProp.test(value) || !reIsDeepProp.test(value) ||
                (object != null && value in Object(object));
        }

        module.exports = isKey;


        /***/
    }),
    /* 288 */
    /***/
    (function(module, exports, __webpack_require__) {

        var memoizeCapped = __webpack_require__(289);

        /** Used to match property names within property paths. */
        var reLeadingDot = /^\./,
            rePropName = /[^.[\]]+|\[(?:(-?\d+(?:\.\d+)?)|(["'])((?:(?!\2)[^\\]|\\.)*?)\2)\]|(?=(?:\.|\[\])(?:\.|\[\]|$))/g;

        /** Used to match backslashes in property paths. */
        var reEscapeChar = /\\(\\)?/g;

        /**
         * Converts `string` to a property path array.
         *
         * @private
         * @param {string} string The string to convert.
         * @returns {Array} Returns the property path array.
         */
        var stringToPath = memoizeCapped(function(string) {
            var result = [];
            if (reLeadingDot.test(string)) {
                result.push('');
            }
            string.replace(rePropName, function(match, number, quote, string) {
                result.push(quote ? string.replace(reEscapeChar, '$1') : (number || match));
            });
            return result;
        });

        module.exports = stringToPath;


        /***/
    }),
    /* 289 */
    /***/
    (function(module, exports, __webpack_require__) {

        var memoize = __webpack_require__(290);

        /** Used as the maximum memoize cache size. */
        var MAX_MEMOIZE_SIZE = 500;

        /**
         * A specialized version of `_.memoize` which clears the memoized function's
         * cache when it exceeds `MAX_MEMOIZE_SIZE`.
         *
         * @private
         * @param {Function} func The function to have its output memoized.
         * @returns {Function} Returns the new memoized function.
         */
        function memoizeCapped(func) {
            var result = memoize(func, function(key) {
                if (cache.size === MAX_MEMOIZE_SIZE) {
                    cache.clear();
                }
                return key;
            });

            var cache = result.cache;
            return result;
        }

        module.exports = memoizeCapped;


        /***/
    }),
    /* 290 */
    /***/
    (function(module, exports, __webpack_require__) {

        var MapCache = __webpack_require__(291);

        /** Error message constants. */
        var FUNC_ERROR_TEXT = 'Expected a function';

        /**
         * Creates a function that memoizes the result of `func`. If `resolver` is
         * provided, it determines the cache key for storing the result based on the
         * arguments provided to the memoized function. By default, the first argument
         * provided to the memoized function is used as the map cache key. The `func`
         * is invoked with the `this` binding of the memoized function.
         *
         * **Note:** The cache is exposed as the `cache` property on the memoized
         * function. Its creation may be customized by replacing the `_.memoize.Cache`
         * constructor with one whose instances implement the
         * [`Map`](http://ecma-international.org/ecma-262/7.0/#sec-properties-of-the-map-prototype-object)
         * method interface of `clear`, `delete`, `get`, `has`, and `set`.
         *
         * @static
         * @memberOf _
         * @since 0.1.0
         * @category Function
         * @param {Function} func The function to have its output memoized.
         * @param {Function} [resolver] The function to resolve the cache key.
         * @returns {Function} Returns the new memoized function.
         * @example
         *
         * var object = { 'a': 1, 'b': 2 };
         * var other = { 'c': 3, 'd': 4 };
         *
         * var values = _.memoize(_.values);
         * values(object);
         * // => [1, 2]
         *
         * values(other);
         * // => [3, 4]
         *
         * object.a = 2;
         * values(object);
         * // => [1, 2]
         *
         * // Modify the result cache.
         * values.cache.set(object, ['a', 'b']);
         * values(object);
         * // => ['a', 'b']
         *
         * // Replace `_.memoize.Cache`.
         * _.memoize.Cache = WeakMap;
         */
        function memoize(func, resolver) {
            if (typeof func != 'function' || (resolver != null && typeof resolver != 'function')) {
                throw new TypeError(FUNC_ERROR_TEXT);
            }
            var memoized = function() {
                var args = arguments,
                    key = resolver ? resolver.apply(this, args) : args[0],
                    cache = memoized.cache;

                if (cache.has(key)) {
                    return cache.get(key);
                }
                var result = func.apply(this, args);
                memoized.cache = cache.set(key, result) || cache;
                return result;
            };
            memoized.cache = new(memoize.Cache || MapCache);
            return memoized;
        }

        // Expose `MapCache`.
        memoize.Cache = MapCache;

        module.exports = memoize;


        /***/
    }),
    /* 291 */
    /***/
    (function(module, exports, __webpack_require__) {

        var mapCacheClear = __webpack_require__(292),
            mapCacheDelete = __webpack_require__(305),
            mapCacheGet = __webpack_require__(307),
            mapCacheHas = __webpack_require__(308),
            mapCacheSet = __webpack_require__(309);

        /**
         * Creates a map cache object to store key-value pairs.
         *
         * @private
         * @constructor
         * @param {Array} [entries] The key-value pairs to cache.
         */
        function MapCache(entries) {
            var index = -1,
                length = entries == null ? 0 : entries.length;

            this.clear();
            while (++index < length) {
                var entry = entries[index];
                this.set(entry[0], entry[1]);
            }
        }

        // Add methods to `MapCache`.
        MapCache.prototype.clear = mapCacheClear;
        MapCache.prototype['delete'] = mapCacheDelete;
        MapCache.prototype.get = mapCacheGet;
        MapCache.prototype.has = mapCacheHas;
        MapCache.prototype.set = mapCacheSet;

        module.exports = MapCache;


        /***/
    }),
    /* 292 */
    /***/
    (function(module, exports, __webpack_require__) {

        var Hash = __webpack_require__(293),
            ListCache = __webpack_require__(299),
            Map = __webpack_require__(234);

        /**
         * Removes all key-value entries from the map.
         *
         * @private
         * @name clear
         * @memberOf MapCache
         */
        function mapCacheClear() {
            this.size = 0;
            this.__data__ = {
                'hash': new Hash,
                'map': new(Map || ListCache),
                'string': new Hash
            };
        }

        module.exports = mapCacheClear;


        /***/
    }),
    /* 293 */
    /***/
    (function(module, exports, __webpack_require__) {

        var hashClear = __webpack_require__(294),
            hashDelete = __webpack_require__(295),
            hashGet = __webpack_require__(296),
            hashHas = __webpack_require__(297),
            hashSet = __webpack_require__(298);

        /**
         * Creates a hash object.
         *
         * @private
         * @constructor
         * @param {Array} [entries] The key-value pairs to cache.
         */
        function Hash(entries) {
            var index = -1,
                length = entries == null ? 0 : entries.length;

            this.clear();
            while (++index < length) {
                var entry = entries[index];
                this.set(entry[0], entry[1]);
            }
        }

        // Add methods to `Hash`.
        Hash.prototype.clear = hashClear;
        Hash.prototype['delete'] = hashDelete;
        Hash.prototype.get = hashGet;
        Hash.prototype.has = hashHas;
        Hash.prototype.set = hashSet;

        module.exports = Hash;


        /***/
    }),
    /* 294 */
    /***/
    (function(module, exports, __webpack_require__) {

        var nativeCreate = __webpack_require__(209);

        /**
         * Removes all key-value entries from the hash.
         *
         * @private
         * @name clear
         * @memberOf Hash
         */
        function hashClear() {
            this.__data__ = nativeCreate ? nativeCreate(null) : {};
            this.size = 0;
        }

        module.exports = hashClear;


        /***/
    }),
    /* 295 */
    /***/
    (function(module, exports) {

        /**
         * Removes `key` and its value from the hash.
         *
         * @private
         * @name delete
         * @memberOf Hash
         * @param {Object} hash The hash to modify.
         * @param {string} key The key of the value to remove.
         * @returns {boolean} Returns `true` if the entry was removed, else `false`.
         */
        function hashDelete(key) {
            var result = this.has(key) && delete this.__data__[key];
            this.size -= result ? 1 : 0;
            return result;
        }

        module.exports = hashDelete;


        /***/
    }),
    /* 296 */
    /***/
    (function(module, exports, __webpack_require__) {

        var nativeCreate = __webpack_require__(209);

        /** Used to stand-in for `undefined` hash values. */
        var HASH_UNDEFINED = '__lodash_hash_undefined__';

        /** Used for built-in method references. */
        var objectProto = Object.prototype;

        /** Used to check objects for own properties. */
        var hasOwnProperty = objectProto.hasOwnProperty;

        /**
         * Gets the hash value for `key`.
         *
         * @private
         * @name get
         * @memberOf Hash
         * @param {string} key The key of the value to get.
         * @returns {*} Returns the entry value.
         */
        function hashGet(key) {
            var data = this.__data__;
            if (nativeCreate) {
                var result = data[key];
                return result === HASH_UNDEFINED ? undefined : result;
            }
            return hasOwnProperty.call(data, key) ? data[key] : undefined;
        }

        module.exports = hashGet;


        /***/
    }),
    /* 297 */
    /***/
    (function(module, exports, __webpack_require__) {

        var nativeCreate = __webpack_require__(209);

        /** Used for built-in method references. */
        var objectProto = Object.prototype;

        /** Used to check objects for own properties. */
        var hasOwnProperty = objectProto.hasOwnProperty;

        /**
         * Checks if a hash value for `key` exists.
         *
         * @private
         * @name has
         * @memberOf Hash
         * @param {string} key The key of the entry to check.
         * @returns {boolean} Returns `true` if an entry for `key` exists, else `false`.
         */
        function hashHas(key) {
            var data = this.__data__;
            return nativeCreate ? (data[key] !== undefined) : hasOwnProperty.call(data, key);
        }

        module.exports = hashHas;


        /***/
    }),
    /* 298 */
    /***/
    (function(module, exports, __webpack_require__) {

        var nativeCreate = __webpack_require__(209);

        /** Used to stand-in for `undefined` hash values. */
        var HASH_UNDEFINED = '__lodash_hash_undefined__';

        /**
         * Sets the hash `key` to `value`.
         *
         * @private
         * @name set
         * @memberOf Hash
         * @param {string} key The key of the value to set.
         * @param {*} value The value to set.
         * @returns {Object} Returns the hash instance.
         */
        function hashSet(key, value) {
            var data = this.__data__;
            this.size += this.has(key) ? 0 : 1;
            data[key] = (nativeCreate && value === undefined) ? HASH_UNDEFINED : value;
            return this;
        }

        module.exports = hashSet;


        /***/
    }),
    /* 299 */
    /***/
    (function(module, exports, __webpack_require__) {

        var listCacheClear = __webpack_require__(300),
            listCacheDelete = __webpack_require__(301),
            listCacheGet = __webpack_require__(302),
            listCacheHas = __webpack_require__(303),
            listCacheSet = __webpack_require__(304);

        /**
         * Creates an list cache object.
         *
         * @private
         * @constructor
         * @param {Array} [entries] The key-value pairs to cache.
         */
        function ListCache(entries) {
            var index = -1,
                length = entries == null ? 0 : entries.length;

            this.clear();
            while (++index < length) {
                var entry = entries[index];
                this.set(entry[0], entry[1]);
            }
        }

        // Add methods to `ListCache`.
        ListCache.prototype.clear = listCacheClear;
        ListCache.prototype['delete'] = listCacheDelete;
        ListCache.prototype.get = listCacheGet;
        ListCache.prototype.has = listCacheHas;
        ListCache.prototype.set = listCacheSet;

        module.exports = ListCache;


        /***/
    }),
    /* 300 */
    /***/
    (function(module, exports) {

        /**
         * Removes all key-value entries from the list cache.
         *
         * @private
         * @name clear
         * @memberOf ListCache
         */
        function listCacheClear() {
            this.__data__ = [];
            this.size = 0;
        }

        module.exports = listCacheClear;


        /***/
    }),
    /* 301 */
    /***/
    (function(module, exports, __webpack_require__) {

        var assocIndexOf = __webpack_require__(210);

        /** Used for built-in method references. */
        var arrayProto = Array.prototype;

        /** Built-in value references. */
        var splice = arrayProto.splice;

        /**
         * Removes `key` and its value from the list cache.
         *
         * @private
         * @name delete
         * @memberOf ListCache
         * @param {string} key The key of the value to remove.
         * @returns {boolean} Returns `true` if the entry was removed, else `false`.
         */
        function listCacheDelete(key) {
            var data = this.__data__,
                index = assocIndexOf(data, key);

            if (index < 0) {
                return false;
            }
            var lastIndex = data.length - 1;
            if (index == lastIndex) {
                data.pop();
            } else {
                splice.call(data, index, 1);
            }
            --this.size;
            return true;
        }

        module.exports = listCacheDelete;


        /***/
    }),
    /* 302 */
    /***/
    (function(module, exports, __webpack_require__) {

        var assocIndexOf = __webpack_require__(210);

        /**
         * Gets the list cache value for `key`.
         *
         * @private
         * @name get
         * @memberOf ListCache
         * @param {string} key The key of the value to get.
         * @returns {*} Returns the entry value.
         */
        function listCacheGet(key) {
            var data = this.__data__,
                index = assocIndexOf(data, key);

            return index < 0 ? undefined : data[index][1];
        }

        module.exports = listCacheGet;


        /***/
    }),
    /* 303 */
    /***/
    (function(module, exports, __webpack_require__) {

        var assocIndexOf = __webpack_require__(210);

        /**
         * Checks if a list cache value for `key` exists.
         *
         * @private
         * @name has
         * @memberOf ListCache
         * @param {string} key The key of the entry to check.
         * @returns {boolean} Returns `true` if an entry for `key` exists, else `false`.
         */
        function listCacheHas(key) {
            return assocIndexOf(this.__data__, key) > -1;
        }

        module.exports = listCacheHas;


        /***/
    }),
    /* 304 */
    /***/
    (function(module, exports, __webpack_require__) {

        var assocIndexOf = __webpack_require__(210);

        /**
         * Sets the list cache `key` to `value`.
         *
         * @private
         * @name set
         * @memberOf ListCache
         * @param {string} key The key of the value to set.
         * @param {*} value The value to set.
         * @returns {Object} Returns the list cache instance.
         */
        function listCacheSet(key, value) {
            var data = this.__data__,
                index = assocIndexOf(data, key);

            if (index < 0) {
                ++this.size;
                data.push([key, value]);
            } else {
                data[index][1] = value;
            }
            return this;
        }

        module.exports = listCacheSet;


        /***/
    }),
    /* 305 */
    /***/
    (function(module, exports, __webpack_require__) {

        var getMapData = __webpack_require__(211);

        /**
         * Removes `key` and its value from the map.
         *
         * @private
         * @name delete
         * @memberOf MapCache
         * @param {string} key The key of the value to remove.
         * @returns {boolean} Returns `true` if the entry was removed, else `false`.
         */
        function mapCacheDelete(key) {
            var result = getMapData(this, key)['delete'](key);
            this.size -= result ? 1 : 0;
            return result;
        }

        module.exports = mapCacheDelete;


        /***/
    }),
    /* 306 */
    /***/
    (function(module, exports) {

        /**
         * Checks if `value` is suitable for use as unique object key.
         *
         * @private
         * @param {*} value The value to check.
         * @returns {boolean} Returns `true` if `value` is suitable, else `false`.
         */
        function isKeyable(value) {
            var type = typeof value;
            return (type == 'string' || type == 'number' || type == 'symbol' || type == 'boolean') ?
                (value !== '__proto__') :
                (value === null);
        }

        module.exports = isKeyable;


        /***/
    }),
    /* 307 */
    /***/
    (function(module, exports, __webpack_require__) {

        var getMapData = __webpack_require__(211);

        /**
         * Gets the map value for `key`.
         *
         * @private
         * @name get
         * @memberOf MapCache
         * @param {string} key The key of the value to get.
         * @returns {*} Returns the entry value.
         */
        function mapCacheGet(key) {
            return getMapData(this, key).get(key);
        }

        module.exports = mapCacheGet;


        /***/
    }),
    /* 308 */
    /***/
    (function(module, exports, __webpack_require__) {

        var getMapData = __webpack_require__(211);

        /**
         * Checks if a map value for `key` exists.
         *
         * @private
         * @name has
         * @memberOf MapCache
         * @param {string} key The key of the entry to check.
         * @returns {boolean} Returns `true` if an entry for `key` exists, else `false`.
         */
        function mapCacheHas(key) {
            return getMapData(this, key).has(key);
        }

        module.exports = mapCacheHas;


        /***/
    }),
    /* 309 */
    /***/
    (function(module, exports, __webpack_require__) {

        var getMapData = __webpack_require__(211);

        /**
         * Sets the map `key` to `value`.
         *
         * @private
         * @name set
         * @memberOf MapCache
         * @param {string} key The key of the value to set.
         * @param {*} value The value to set.
         * @returns {Object} Returns the map cache instance.
         */
        function mapCacheSet(key, value) {
            var data = getMapData(this, key),
                size = data.size;

            data.set(key, value);
            this.size += data.size == size ? 0 : 1;
            return this;
        }

        module.exports = mapCacheSet;


        /***/
    }),
    /* 310 */
    /***/
    (function(module, exports, __webpack_require__) {

        var baseToString = __webpack_require__(311);

        /**
         * Converts `value` to a string. An empty string is returned for `null`
         * and `undefined` values. The sign of `-0` is preserved.
         *
         * @static
         * @memberOf _
         * @since 4.0.0
         * @category Lang
         * @param {*} value The value to convert.
         * @returns {string} Returns the converted string.
         * @example
         *
         * _.toString(null);
         * // => ''
         *
         * _.toString(-0);
         * // => '-0'
         *
         * _.toString([1, 2, 3]);
         * // => '1,2,3'
         */
        function toString(value) {
            return value == null ? '' : baseToString(value);
        }

        module.exports = toString;


        /***/
    }),
    /* 311 */
    /***/
    (function(module, exports, __webpack_require__) {

        var Symbol = __webpack_require__(205),
            arrayMap = __webpack_require__(312),
            isArray = __webpack_require__(70),
            isSymbol = __webpack_require__(221);

        /** Used as references for various `Number` constants. */
        var INFINITY = 1 / 0;

        /** Used to convert symbols to primitives and strings. */
        var symbolProto = Symbol ? Symbol.prototype : undefined,
            symbolToString = symbolProto ? symbolProto.toString : undefined;

        /**
         * The base implementation of `_.toString` which doesn't convert nullish
         * values to empty strings.
         *
         * @private
         * @param {*} value The value to process.
         * @returns {string} Returns the string.
         */
        function baseToString(value) {
            // Exit early for strings to avoid a performance hit in some environments.
            if (typeof value == 'string') {
                return value;
            }
            if (isArray(value)) {
                // Recursively convert values (susceptible to call stack limits).
                return arrayMap(value, baseToString) + '';
            }
            if (isSymbol(value)) {
                return symbolToString ? symbolToString.call(value) : '';
            }
            var result = (value + '');
            return (result == '0' && (1 / value) == -INFINITY) ? '-0' : result;
        }

        module.exports = baseToString;


        /***/
    }),
    /* 312 */
    /***/
    (function(module, exports) {

        /**
         * A specialized version of `_.map` for arrays without support for iteratee
         * shorthands.
         *
         * @private
         * @param {Array} [array] The array to iterate over.
         * @param {Function} iteratee The function invoked per iteration.
         * @returns {Array} Returns the new mapped array.
         */
        function arrayMap(array, iteratee) {
            var index = -1,
                length = array == null ? 0 : array.length,
                result = Array(length);

            while (++index < length) {
                result[index] = iteratee(array[index], index, array);
            }
            return result;
        }

        module.exports = arrayMap;


        /***/
    }),
    /* 313 */
    /***/
    (function(module, exports, __webpack_require__) {

        var assignValue = __webpack_require__(224),
            castPath = __webpack_require__(208),
            isIndex = __webpack_require__(212),
            isObject = __webpack_require__(202),
            toKey = __webpack_require__(223);

        /**
         * The base implementation of `_.set`.
         *
         * @private
         * @param {Object} object The object to modify.
         * @param {Array|string} path The path of the property to set.
         * @param {*} value The value to set.
         * @param {Function} [customizer] The function to customize path creation.
         * @returns {Object} Returns `object`.
         */
        function baseSet(object, path, value, customizer) {
            if (!isObject(object)) {
                return object;
            }
            path = castPath(path, object);

            var index = -1,
                length = path.length,
                lastIndex = length - 1,
                nested = object;

            while (nested != null && ++index < length) {
                var key = toKey(path[index]),
                    newValue = value;

                if (index != lastIndex) {
                    var objValue = nested[key];
                    newValue = customizer ? customizer(objValue, key, nested) : undefined;
                    if (newValue === undefined) {
                        newValue = isObject(objValue) ?
                            objValue :
                            (isIndex(path[index + 1]) ? [] : {});
                    }
                }
                assignValue(nested, key, newValue);
                nested = nested[key];
            }
            return object;
        }

        module.exports = baseSet;


        /***/
    }),
    /* 314 */
    /***/
    (function(module, exports, __webpack_require__) {

        var baseHasIn = __webpack_require__(315),
            hasPath = __webpack_require__(316);

        /**
         * Checks if `path` is a direct or inherited property of `object`.
         *
         * @static
         * @memberOf _
         * @since 4.0.0
         * @category Object
         * @param {Object} object The object to query.
         * @param {Array|string} path The path to check.
         * @returns {boolean} Returns `true` if `path` exists, else `false`.
         * @example
         *
         * var object = _.create({ 'a': _.create({ 'b': 2 }) });
         *
         * _.hasIn(object, 'a');
         * // => true
         *
         * _.hasIn(object, 'a.b');
         * // => true
         *
         * _.hasIn(object, ['a', 'b']);
         * // => true
         *
         * _.hasIn(object, 'b');
         * // => false
         */
        function hasIn(object, path) {
            return object != null && hasPath(object, path, baseHasIn);
        }

        module.exports = hasIn;


        /***/
    }),
    /* 315 */
    /***/
    (function(module, exports) {

        /**
         * The base implementation of `_.hasIn` without support for deep paths.
         *
         * @private
         * @param {Object} [object] The object to query.
         * @param {Array|string} key The key to check.
         * @returns {boolean} Returns `true` if `key` exists, else `false`.
         */
        function baseHasIn(object, key) {
            return object != null && key in Object(object);
        }

        module.exports = baseHasIn;


        /***/
    }),
    /* 316 */
    /***/
    (function(module, exports, __webpack_require__) {

        var castPath = __webpack_require__(208),
            isArguments = __webpack_require__(206),
            isArray = __webpack_require__(70),
            isIndex = __webpack_require__(212),
            isLength = __webpack_require__(220),
            toKey = __webpack_require__(223);

        /**
         * Checks if `path` exists on `object`.
         *
         * @private
         * @param {Object} object The object to query.
         * @param {Array|string} path The path to check.
         * @param {Function} hasFunc The function to check properties.
         * @returns {boolean} Returns `true` if `path` exists, else `false`.
         */
        function hasPath(object, path, hasFunc) {
            path = castPath(path, object);

            var index = -1,
                length = path.length,
                result = false;

            while (++index < length) {
                var key = toKey(path[index]);
                if (!(result = object != null && hasFunc(object, key))) {
                    break;
                }
                object = object[key];
            }
            if (result || ++index != length) {
                return result;
            }
            length = object == null ? 0 : object.length;
            return !!length && isLength(length) && isIndex(key, length) &&
                (isArray(object) || isArguments(object));
        }

        module.exports = hasPath;


        /***/
    }),
    /* 317 */
    /***/
    (function(module, exports, __webpack_require__) {

        var flatten = __webpack_require__(318),
            overRest = __webpack_require__(242),
            setToString = __webpack_require__(243);

        /**
         * A specialized version of `baseRest` which flattens the rest array.
         *
         * @private
         * @param {Function} func The function to apply a rest parameter to.
         * @returns {Function} Returns the new function.
         */
        function flatRest(func) {
            return setToString(overRest(func, undefined, flatten), func + '');
        }

        module.exports = flatRest;


        /***/
    }),
    /* 318 */
    /***/
    (function(module, exports, __webpack_require__) {

        var baseFlatten = __webpack_require__(319);

        /**
         * Flattens `array` a single level deep.
         *
         * @static
         * @memberOf _
         * @since 0.1.0
         * @category Array
         * @param {Array} array The array to flatten.
         * @returns {Array} Returns the new flattened array.
         * @example
         *
         * _.flatten([1, [2, [3, [4]], 5]]);
         * // => [1, 2, [3, [4]], 5]
         */
        function flatten(array) {
            var length = array == null ? 0 : array.length;
            return length ? baseFlatten(array, 1) : [];
        }

        module.exports = flatten;


        /***/
    }),
    /* 319 */
    /***/
    (function(module, exports, __webpack_require__) {

        var arrayPush = __webpack_require__(320),
            isFlattenable = __webpack_require__(321);

        /**
         * The base implementation of `_.flatten` with support for restricting flattening.
         *
         * @private
         * @param {Array} array The array to flatten.
         * @param {number} depth The maximum recursion depth.
         * @param {boolean} [predicate=isFlattenable] The function invoked per iteration.
         * @param {boolean} [isStrict] Restrict to values that pass `predicate` checks.
         * @param {Array} [result=[]] The initial result value.
         * @returns {Array} Returns the new flattened array.
         */
        function baseFlatten(array, depth, predicate, isStrict, result) {
            var index = -1,
                length = array.length;

            predicate || (predicate = isFlattenable);
            result || (result = []);

            while (++index < length) {
                var value = array[index];
                if (depth > 0 && predicate(value)) {
                    if (depth > 1) {
                        // Recursively flatten arrays (susceptible to call stack limits).
                        baseFlatten(value, depth - 1, predicate, isStrict, result);
                    } else {
                        arrayPush(result, value);
                    }
                } else if (!isStrict) {
                    result[result.length] = value;
                }
            }
            return result;
        }

        module.exports = baseFlatten;


        /***/
    }),
    /* 320 */
    /***/
    (function(module, exports) {

        /**
         * Appends the elements of `values` to `array`.
         *
         * @private
         * @param {Array} array The array to modify.
         * @param {Array} values The values to append.
         * @returns {Array} Returns `array`.
         */
        function arrayPush(array, values) {
            var index = -1,
                length = values.length,
                offset = array.length;

            while (++index < length) {
                array[offset + index] = values[index];
            }
            return array;
        }

        module.exports = arrayPush;


        /***/
    }),
    /* 321 */
    /***/
    (function(module, exports, __webpack_require__) {

        var Symbol = __webpack_require__(205),
            isArguments = __webpack_require__(206),
            isArray = __webpack_require__(70);

        /** Built-in value references. */
        var spreadableSymbol = Symbol ? Symbol.isConcatSpreadable : undefined;

        /**
         * Checks if `value` is a flattenable `arguments` object or array.
         *
         * @private
         * @param {*} value The value to check.
         * @returns {boolean} Returns `true` if `value` is flattenable, else `false`.
         */
        function isFlattenable(value) {
            return isArray(value) || isArguments(value) ||
                !!(spreadableSymbol && value && value[spreadableSymbol]);
        }

        module.exports = isFlattenable;


        /***/
    }),
    /* 322 */
    /***/
    (function(module, exports) {

        /**
         * A faster alternative to `Function#apply`, this function invokes `func`
         * with the `this` binding of `thisArg` and the arguments of `args`.
         *
         * @private
         * @param {Function} func The function to invoke.
         * @param {*} thisArg The `this` binding of `func`.
         * @param {Array} args The arguments to invoke `func` with.
         * @returns {*} Returns the result of `func`.
         */
        function apply(func, thisArg, args) {
            switch (args.length) {
                case 0:
                    return func.call(thisArg);
                case 1:
                    return func.call(thisArg, args[0]);
                case 2:
                    return func.call(thisArg, args[0], args[1]);
                case 3:
                    return func.call(thisArg, args[0], args[1], args[2]);
            }
            return func.apply(thisArg, args);
        }

        module.exports = apply;


        /***/
    }),
    /* 323 */
    /***/
    (function(module, exports, __webpack_require__) {

        var constant = __webpack_require__(324),
            defineProperty = __webpack_require__(241),
            identity = __webpack_require__(244);

        /**
         * The base implementation of `setToString` without support for hot loop shorting.
         *
         * @private
         * @param {Function} func The function to modify.
         * @param {Function} string The `toString` result.
         * @returns {Function} Returns `func`.
         */
        var baseSetToString = !defineProperty ? identity : function(func, string) {
            return defineProperty(func, 'toString', {
                'configurable': true,
                'enumerable': false,
                'value': constant(string),
                'writable': true
            });
        };

        module.exports = baseSetToString;


        /***/
    }),
    /* 324 */
    /***/
    (function(module, exports) {

        /**
         * Creates a function that returns `value`.
         *
         * @static
         * @memberOf _
         * @since 2.4.0
         * @category Util
         * @param {*} value The value to return from the new function.
         * @returns {Function} Returns the new constant function.
         * @example
         *
         * var objects = _.times(2, _.constant({ 'a': 1 }));
         *
         * console.log(objects);
         * // => [{ 'a': 1 }, { 'a': 1 }]
         *
         * console.log(objects[0] === objects[1]);
         * // => true
         */
        function constant(value) {
            return function() {
                return value;
            };
        }

        module.exports = constant;


        /***/
    }),
    /* 325 */
    /***/
    (function(module, exports) {

        /** Used to detect hot functions by number of calls within a span of milliseconds. */
        var HOT_COUNT = 800,
            HOT_SPAN = 16;

        /* Built-in method references for those with the same name as other `lodash` methods. */
        var nativeNow = Date.now;

        /**
         * Creates a function that'll short out and invoke `identity` instead
         * of `func` when it's called `HOT_COUNT` or more times in `HOT_SPAN`
         * milliseconds.
         *
         * @private
         * @param {Function} func The function to restrict.
         * @returns {Function} Returns the new shortable function.
         */
        function shortOut(func) {
            var count = 0,
                lastCalled = 0;

            return function() {
                var stamp = nativeNow(),
                    remaining = HOT_SPAN - (stamp - lastCalled);

                lastCalled = stamp;
                if (remaining > 0) {
                    if (++count >= HOT_COUNT) {
                        return arguments[0];
                    }
                } else {
                    count = 0;
                }
                return func.apply(undefined, arguments);
            };
        }

        module.exports = shortOut;


        /***/
    }),
    /* 326 */
    /***/
    (function(module, exports, __webpack_require__) {

        var assignValue = __webpack_require__(224),
            copyObject = __webpack_require__(327),
            createAssigner = __webpack_require__(328),
            isArrayLike = __webpack_require__(207),
            isPrototype = __webpack_require__(219),
            keys = __webpack_require__(331);

        /** Used for built-in method references. */
        var objectProto = Object.prototype;

        /** Used to check objects for own properties. */
        var hasOwnProperty = objectProto.hasOwnProperty;

        /**
         * Assigns own enumerable string keyed properties of source objects to the
         * destination object. Source objects are applied from left to right.
         * Subsequent sources overwrite property assignments of previous sources.
         *
         * **Note:** This method mutates `object` and is loosely based on
         * [`Object.assign`](https://mdn.io/Object/assign).
         *
         * @static
         * @memberOf _
         * @since 0.10.0
         * @category Object
         * @param {Object} object The destination object.
         * @param {...Object} [sources] The source objects.
         * @returns {Object} Returns `object`.
         * @see _.assignIn
         * @example
         *
         * function Foo() {
         *   this.a = 1;
         * }
         *
         * function Bar() {
         *   this.c = 3;
         * }
         *
         * Foo.prototype.b = 2;
         * Bar.prototype.d = 4;
         *
         * _.assign({ 'a': 0 }, new Foo, new Bar);
         * // => { 'a': 1, 'c': 3 }
         */
        var assign = createAssigner(function(object, source) {
            if (isPrototype(source) || isArrayLike(source)) {
                copyObject(source, keys(source), object);
                return;
            }
            for (var key in source) {
                if (hasOwnProperty.call(source, key)) {
                    assignValue(object, key, source[key]);
                }
            }
        });

        module.exports = assign;


        /***/
    }),
    /* 327 */
    /***/
    (function(module, exports, __webpack_require__) {

        var assignValue = __webpack_require__(224),
            baseAssignValue = __webpack_require__(240);

        /**
         * Copies properties of `source` to `object`.
         *
         * @private
         * @param {Object} source The object to copy properties from.
         * @param {Array} props The property identifiers to copy.
         * @param {Object} [object={}] The object to copy properties to.
         * @param {Function} [customizer] The function to customize copied values.
         * @returns {Object} Returns `object`.
         */
        function copyObject(source, props, object, customizer) {
            var isNew = !object;
            object || (object = {});

            var index = -1,
                length = props.length;

            while (++index < length) {
                var key = props[index];

                var newValue = customizer ?
                    customizer(object[key], source[key], key, object, source) :
                    undefined;

                if (newValue === undefined) {
                    newValue = source[key];
                }
                if (isNew) {
                    baseAssignValue(object, key, newValue);
                } else {
                    assignValue(object, key, newValue);
                }
            }
            return object;
        }

        module.exports = copyObject;


        /***/
    }),
    /* 328 */
    /***/
    (function(module, exports, __webpack_require__) {

        var baseRest = __webpack_require__(329),
            isIterateeCall = __webpack_require__(330);

        /**
         * Creates a function like `_.assign`.
         *
         * @private
         * @param {Function} assigner The function to assign values.
         * @returns {Function} Returns the new assigner function.
         */
        function createAssigner(assigner) {
            return baseRest(function(object, sources) {
                var index = -1,
                    length = sources.length,
                    customizer = length > 1 ? sources[length - 1] : undefined,
                    guard = length > 2 ? sources[2] : undefined;

                customizer = (assigner.length > 3 && typeof customizer == 'function') ?
                    (length--, customizer) :
                    undefined;

                if (guard && isIterateeCall(sources[0], sources[1], guard)) {
                    customizer = length < 3 ? undefined : customizer;
                    length = 1;
                }
                object = Object(object);
                while (++index < length) {
                    var source = sources[index];
                    if (source) {
                        assigner(object, source, index, customizer);
                    }
                }
                return object;
            });
        }

        module.exports = createAssigner;


        /***/
    }),
    /* 329 */
    /***/
    (function(module, exports, __webpack_require__) {

        var identity = __webpack_require__(244),
            overRest = __webpack_require__(242),
            setToString = __webpack_require__(243);

        /**
         * The base implementation of `_.rest` which doesn't validate or coerce arguments.
         *
         * @private
         * @param {Function} func The function to apply a rest parameter to.
         * @param {number} [start=func.length-1] The start position of the rest parameter.
         * @returns {Function} Returns the new function.
         */
        function baseRest(func, start) {
            return setToString(overRest(func, start, identity), func + '');
        }

        module.exports = baseRest;


        /***/
    }),
    /* 330 */
    /***/
    (function(module, exports, __webpack_require__) {

        var eq = __webpack_require__(222),
            isArrayLike = __webpack_require__(207),
            isIndex = __webpack_require__(212),
            isObject = __webpack_require__(202);

        /**
         * Checks if the given arguments are from an iteratee call.
         *
         * @private
         * @param {*} value The potential iteratee value argument.
         * @param {*} index The potential iteratee index or key argument.
         * @param {*} object The potential iteratee object argument.
         * @returns {boolean} Returns `true` if the arguments are from an iteratee call,
         *  else `false`.
         */
        function isIterateeCall(value, index, object) {
            if (!isObject(object)) {
                return false;
            }
            var type = typeof index;
            if (type == 'number' ?
                (isArrayLike(object) && isIndex(index, object.length)) :
                (type == 'string' && index in object)
            ) {
                return eq(object[index], value);
            }
            return false;
        }

        module.exports = isIterateeCall;


        /***/
    }),
    /* 331 */
    /***/
    (function(module, exports, __webpack_require__) {

        var arrayLikeKeys = __webpack_require__(332),
            baseKeys = __webpack_require__(231),
            isArrayLike = __webpack_require__(207);

        /**
         * Creates an array of the own enumerable property names of `object`.
         *
         * **Note:** Non-object values are coerced to objects. See the
         * [ES spec](http://ecma-international.org/ecma-262/7.0/#sec-object.keys)
         * for more details.
         *
         * @static
         * @since 0.1.0
         * @memberOf _
         * @category Object
         * @param {Object} object The object to query.
         * @returns {Array} Returns the array of property names.
         * @example
         *
         * function Foo() {
         *   this.a = 1;
         *   this.b = 2;
         * }
         *
         * Foo.prototype.c = 3;
         *
         * _.keys(new Foo);
         * // => ['a', 'b'] (iteration order is not guaranteed)
         *
         * _.keys('hi');
         * // => ['0', '1']
         */
        function keys(object) {
            return isArrayLike(object) ? arrayLikeKeys(object) : baseKeys(object);
        }

        module.exports = keys;


        /***/
    }),
    /* 332 */
    /***/
    (function(module, exports, __webpack_require__) {

        var baseTimes = __webpack_require__(333),
            isArguments = __webpack_require__(206),
            isArray = __webpack_require__(70),
            isBuffer = __webpack_require__(235),
            isIndex = __webpack_require__(212),
            isTypedArray = __webpack_require__(236);

        /** Used for built-in method references. */
        var objectProto = Object.prototype;

        /** Used to check objects for own properties. */
        var hasOwnProperty = objectProto.hasOwnProperty;

        /**
         * Creates an array of the enumerable property names of the array-like `value`.
         *
         * @private
         * @param {*} value The value to query.
         * @param {boolean} inherited Specify returning inherited property names.
         * @returns {Array} Returns the array of property names.
         */
        function arrayLikeKeys(value, inherited) {
            var isArr = isArray(value),
                isArg = !isArr && isArguments(value),
                isBuff = !isArr && !isArg && isBuffer(value),
                isType = !isArr && !isArg && !isBuff && isTypedArray(value),
                skipIndexes = isArr || isArg || isBuff || isType,
                result = skipIndexes ? baseTimes(value.length, String) : [],
                length = result.length;

            for (var key in value) {
                if ((inherited || hasOwnProperty.call(value, key)) &&
                    !(skipIndexes && (
                        // Safari 9 has enumerable `arguments.length` in strict mode.
                        key == 'length' ||
                        // Node.js 0.10 has enumerable non-index properties on buffers.
                        (isBuff && (key == 'offset' || key == 'parent')) ||
                        // PhantomJS 2 has enumerable non-index properties on typed arrays.
                        (isType && (key == 'buffer' || key == 'byteLength' || key == 'byteOffset')) ||
                        // Skip index properties.
                        isIndex(key, length)
                    ))) {
                    result.push(key);
                }
            }
            return result;
        }

        module.exports = arrayLikeKeys;


        /***/
    }),
    /* 333 */
    /***/
    (function(module, exports) {

        /**
         * The base implementation of `_.times` without support for iteratee shorthands
         * or max array length checks.
         *
         * @private
         * @param {number} n The number of times to invoke `iteratee`.
         * @param {Function} iteratee The function invoked per iteration.
         * @returns {Array} Returns the array of results.
         */
        function baseTimes(n, iteratee) {
            var index = -1,
                result = Array(n);

            while (++index < n) {
                result[index] = iteratee(index);
            }
            return result;
        }

        module.exports = baseTimes;


        /***/
    }),
    /* 334 */
    /***/
    (function(module, exports, __webpack_require__) {

        "use strict";


        Object.defineProperty(exports, "__esModule", {
            value: true
        });
        var assert = exports.assert = function assert(condition, msg) {
            if (!condition) throw new Error("[eros-widget] " + msg);
        };

        /***/
    }),
    /* 335 */
    /***/
    (function(module, exports, __webpack_require__) {

        "use strict";


        var _promise = __webpack_require__(53);

        var _promise2 = _interopRequireDefault(_promise);

        var _create = __webpack_require__(49);

        var _create2 = _interopRequireDefault(_create);

        var _isFunction = __webpack_require__(50);

        var _isFunction2 = _interopRequireDefault(_isFunction);

        function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

        var modal = weex.requireModule('bmModal'),
            geolocation = weex.requireModule('bmGeolocation');

        var Geolocation = (0, _create2.default)(null);

        Geolocation.install = function(Vue) {
            Vue.prototype.$geo = {
                get: function get(callback) {
                    var _this = this;

                    return new _promise2.default(function(resolve, reject) {
                        geolocation.getGeolocation(function(resData) {
                            if (!resData) {
                                resData = {
                                    resCode: -1,
                                    msg: '获取信息失败，请重试',
                                    data: {}
                                };
                            }
                            if ((0, _isFunction2.default)(callback)) {
                                callback.call(_this, resData);
                            }
                            if (resData && resData.resCode == 0) {
                                resolve(resData);
                            } else {
                                resData.msg && modal.alert({
                                    message: resData.msg,
                                    okTitle: '确定'
                                });
                                reject(resData);
                            }
                        });
                    });
                }
            };
        };

        Vue.use(Geolocation);

        /***/
    }),
    /* 336 */
    /***/
    (function(module, exports, __webpack_require__) {

        "use strict";


        var _promise = __webpack_require__(53);

        var _promise2 = _interopRequireDefault(_promise);

        var _create = __webpack_require__(49);

        var _create2 = _interopRequireDefault(_create);

        var _isFunction = __webpack_require__(50);

        var _isFunction2 = _interopRequireDefault(_isFunction);

        function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

        /**
         * @Author: songqi
         * @Date:   2017-01-11
         * @Last modified by:   songqi
         * @Last modified time: 2017-03-08
         */

        var camera = weex.requireModule('bmCamera'),
            _browser = weex.requireModule('bmBrowserImg'),
            modal = weex.requireModule('bmModal');

        var Camera = (0, _create2.default)(null);
        var Image = (0, _create2.default)(null);
        Image.install = function(Vue, options) {
            Vue.prototype.$image = {
                // 上传图片
                upload: function upload(options, callback) {
                    var _this = this;

                    var options = options || {};
                    if ((0, _isFunction2.default)(options) && !callback) {
                        callback = options;
                        options = {};
                    }
                    return new _promise2.default(function(resolve, reject) {
                        camera.uploadImage({
                            maxCount: options.maxCount || 1,
                            imageWidth: options.imageWidth || 0,
                            allowCrop: options.allowCrop || false
                        }, function(resData) {
                            if (!resData) {
                                resData = {
                                    resCode: -1,
                                    msg: '获取信息失败，请重试',
                                    data: {}
                                };
                            }
                            if ((0, _isFunction2.default)(callback)) {
                                callback.call(_this, resData);
                            }
                            if (resData && resData.resCode == 0 && resData.data && resData.data && resData.data.length) {
                                resolve(resData);
                            } else {
                                resData.msg && modal.alert({
                                    message: resData.msg || '上传图片失败',
                                    okTitle: '确定'
                                });
                                reject(resData);
                            }
                        });
                    });
                },

                // 浏览图片
                browser: function browser(options, callback) {
                    var options = options || {};
                    if ((0, _isFunction2.default)(options) && !callback) {
                        callback = options;
                        options = {};
                    }

                    return new _promise2.default(function(resolve, reject) {
                        _browser.open({
                            index: options.index,
                            images: options.images,
                            type: 'network'
                        }, function(resData) {
                            // console.log(resData)
                        });
                    });
                }
            };
        };

        Camera.install = function(Vue, options) {
            Vue.prototype.$camera = {
                // 扫一扫
                scan: function scan(callback) {
                    var _this2 = this;

                    return new _promise2.default(function(resolve, reject) {
                        camera.scan(function(resData) {
                            if (!resData) {
                                resData = {
                                    resCode: -1,
                                    msg: '获取信息失败，请重试',
                                    data: {}
                                };
                            }
                            if ((0, _isFunction2.default)(callback)) {
                                callback.call(_this2, resData);
                            }
                            if (resData && resData.resCode == 0) {
                                resolve(resData);
                            } else {
                                resData.msg && modal.alert({
                                    message: resData.msg,
                                    okTitle: '确定'
                                });
                                reject(resData);
                            }
                        });
                    });
                }
            };
        };

        Vue.use(Camera);
        Vue.use(Image);

        /***/
    }),
    /* 337 */
    /***/
    (function(module, exports, __webpack_require__) {

        "use strict";


        var _create = __webpack_require__(49);

        var _create2 = _interopRequireDefault(_create);

        var _isFunction = __webpack_require__(50);

        var _isFunction2 = _interopRequireDefault(_isFunction);

        function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

        var navigator = weex.requireModule('bmNavigator'),
            modal = weex.requireModule('bmModal');

        var Navigator = (0, _create2.default)(null);

        Navigator.install = function(Vue, options) {
            Vue.prototype.$navigator = {
                setLeftItem: function setLeftItem(options, callback) {
                    navigator.setLeftItem(options, function() {
                        (0, _isFunction2.default)(callback) && callback();
                    });
                },
                setRightItem: function setRightItem(options, callback) {
                    navigator.setRightItem(options, function() {
                        (0, _isFunction2.default)(callback) && callback();
                    });
                },
                setCenterItem: function setCenterItem(options, callback) {
                    navigator.setCenterItem(options, function() {
                        (0, _isFunction2.default)(callback) && callback();
                    });
                },
                setNavigationInfo: function setNavigationInfo(options, callback) {
                    navigator.setNavigationInfo(options, function() {
                        (0, _isFunction2.default)(callback) && callback();
                    });
                }
            };
        };

        Vue.use(Navigator);

        /***/
    }),
    /* 338 */
    /***/
    (function(module, exports, __webpack_require__) {

        "use strict";


        var _promise = __webpack_require__(53);

        var _promise2 = _interopRequireDefault(_promise);

        var _create = __webpack_require__(49);

        var _create2 = _interopRequireDefault(_create);

        var _isFunction = __webpack_require__(50);

        var _isFunction2 = _interopRequireDefault(_isFunction);

        function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

        /**
         * @Author: songqi
         * @Date:   2017-01-11
         * @Last modified by:   songqi
         * @Last modified time: 2017-02-09
         */

        var pay = weex.requireModule('bmPay'),
            modal = weex.requireModule('bmModal');

        var Pay = (0, _create2.default)(null);

        Pay.install = function(Vue, options) {
            Vue.prototype.$pay = {
                wechat: function wechat(params, callback) {
                    var _this = this;

                    return new _promise2.default(function(resolve, reject) {
                        pay.payByWechat(params, function(resData) {
                            if ((0, _isFunction2.default)(callback)) {
                                callback.call(_this, resData);
                            }
                            if (resData && resData.resCode == 0) {
                                resolve(resData);
                            } else {
                                reject(resData);
                            }
                        });
                    });
                }
            };
        };

        Vue.use(Pay);

        /***/
    }),
    /* 339 */
    /***/
    (function(module, exports, __webpack_require__) {

        "use strict";


        var _promise = __webpack_require__(53);

        var _promise2 = _interopRequireDefault(_promise);

        var _create = __webpack_require__(49);

        var _create2 = _interopRequireDefault(_create);

        var _isEmpty = __webpack_require__(218);

        var _isEmpty2 = _interopRequireDefault(_isEmpty);

        var _isFunction = __webpack_require__(50);

        var _isFunction2 = _interopRequireDefault(_isFunction);

        function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

        var storage = weex.requireModule('bmStorage'),
            modal = weex.requireModule('bmModal');

        var Storage = (0, _create2.default)(null);

        Storage.install = function(Vue, options) {
            Vue.prototype.$storage = {
                set: function set(key, value, callback) {
                    var _this = this;

                    return new _promise2.default(function(resolve, reject) {
                        storage.setData(key, value, function(resData) {
                            if ((0, _isFunction2.default)(callback)) {
                                callback.call(_this, resData);
                            }
                            if (resData && resData.resCode == 0) {
                                resolve(true);
                            } else {
                                reject(false);
                            }
                        });
                    });
                },
                setSync: function setSync(key, value) {
                    var resData = storage.setDataSync(key, value);
                    return resData && resData.resCode == 0;
                },
                get: function get(key, callback) {
                    var _this2 = this;

                    return new _promise2.default(function(resolve, reject) {
                        storage.getData(key, function(resData) {
                            resData.data = JSON.parse(resData.data.value || '{}');
                            if ((0, _isFunction2.default)(callback)) {
                                callback.call(_this2, resData);
                            }
                            if (resData && resData.resCode == 0) {
                                resolve(resData.data);
                            } else if (resData && resData.resCode == 9) {
                                // 如果发现值不存在则返回空字符串
                                resolve(false);
                            } else {
                                reject(resData);
                            }
                        });
                    });
                },
                getSync: function getSync(key) {
                    var resData = storage.getDataSync(key),
                        _code = resData && resData.resCode;

                    resData.data = JSON.parse(resData.data.value || '{}');
                    if (_code == 0) {
                        return resData.data;
                    }
                    if (_code == 9) {
                        return false;
                    }
                },
                delete: function _delete(key, callback) {
                    var _this3 = this;

                    return new _promise2.default(function(resolve, reject) {
                        storage.deleteData(key, function(resData) {
                            if ((0, _isFunction2.default)(callback)) {
                                callback.call(_this3, resData);
                            }
                            if (resData && resData.resCode == 0) {
                                resolve(true);
                            } else {
                                reject(false);
                            }
                        });
                    });
                },
                deleteSync: function deleteSync(key) {
                    var resData = storage.deleteDataSync(key);
                    return resData && resData.resCode == 0;
                },
                removeAll: function removeAll(callback) {
                    var _this4 = this;

                    return new _promise2.default(function(resolve, reject) {
                        storage.removeData(function(resData) {
                            if ((0, _isFunction2.default)(callback)) {
                                callback.call(_this4, resData);
                            }
                            if (resData && resData.resCode == 0) {
                                resolve(true);
                            } else {
                                reject(false);
                            }
                        });
                    });
                },
                removeAllSync: function removeAllSync() {
                    var resData = storage.removeDataSync();
                    return resData && resData.resCode == 0;
                }
            };
        };

        Vue.use(Storage);

        /***/
    }),
    /* 340 */
    /***/
    (function(module, exports, __webpack_require__) {

        "use strict";


        var _create = __webpack_require__(49);

        var _create2 = _interopRequireDefault(_create);

        var _isArray2 = __webpack_require__(70);

        var _isArray3 = _interopRequireDefault(_isArray2);

        function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

        // import { dispatch } from 'Utils/message'

        var event = weex.requireModule('bmEvents'),
            globalEvent = weex.requireModule('globalEvent');
        /**
         * @Author: songqi
         * @Date:   2017-02-27
         * @Last modified by:   songqi
         * @Last modified time: 2017-04-10
         */

        var GlobalEvent = (0, _create2.default)(null);
        var GLOBALEVENT = (0, _create2.default)(null);

        // app 被放到后台 appWillResignActive
        globalEvent.addEventListener("appDeactive", function(options) {
            (0, _isArray3.default)(GLOBALEVENT['appDeactive']) && GLOBALEVENT['appDeactive'].map(function(item) {
                item(options);
            });
        });

        // app 从后台唤起 appDidBecomeActive
        globalEvent.addEventListener("appActive", function(options) {
            (0, _isArray3.default)(GLOBALEVENT['appActive']) && GLOBALEVENT['appActive'].map(function(item) {
                item(options);
            });
        });

        GlobalEvent.install = function(Vue, options) {
            Vue.mixin({
                beforeCreate: function beforeCreate() {
                    if (this.$options.globalEvent) {
                        var ev = this.$options.globalEvent;
                        for (var i in ev) {
                            if (!GLOBALEVENT[i]) {
                                GLOBALEVENT[i] = [];
                            }
                            GLOBALEVENT[i].push(ev[i].bind(this));
                        }
                    }
                }
            });
            Vue.prototype.$event = event;
        };

        Vue.use(GlobalEvent);

        /***/
    }),
    /* 341 */
    /***/
    (function(module, exports, __webpack_require__) {

        "use strict";


        var _promise = __webpack_require__(53);

        var _promise2 = _interopRequireDefault(_promise);

        var _create = __webpack_require__(49);

        var _create2 = _interopRequireDefault(_create);

        function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

        var share = weex.requireModule('bmShare');

        var Share = (0, _create2.default)(null);

        Share.install = function(Vue, options) {
            Vue.prototype.$share = function(cfg) {
                return new _promise2.default(function(resolve, reject) {
                    share.share({
                        title: cfg.title,
                        content: cfg.content || '',
                        image: cfg.image || '',
                        url: cfg.url || '',
                        platforms: cfg.platforms || [] // 传空的话默认全部

                    }, function(data) {
                        resolve(data);
                    }, function(err) {
                        reject(err);
                    });
                });
            };
        };

        Vue.use(Share);

        /***/
    }),
    /* 342 */
    /***/
    (function(module, exports, __webpack_require__) {

        "use strict";


        var _promise = __webpack_require__(53);

        var _promise2 = _interopRequireDefault(_promise);

        var _create = __webpack_require__(49);

        var _create2 = _interopRequireDefault(_create);

        var _isFunction = __webpack_require__(50);

        var _isFunction2 = _interopRequireDefault(_isFunction);

        function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

        var tools = weex.requireModule('bmTool');
        /**
         * @Author: songqi
         * @Date:   2017-05-05
         * @Last modified by:   songqi
         * @Last modified time: 2017-05-08
         */

        var Tools = (0, _create2.default)(null);

        Tools.install = function(Vue, options) {
            Vue.prototype.$tools = {
                // 收起键盘
                resignKeyboard: function resignKeyboard() {
                    return new _promise2.default(function(resolve, reject) {
                        tools.resignKeyboard(function(resData) {
                            if (resData && resData.resCode == 0) {
                                resolve(resData);
                            } else {
                                reject(resData);
                            }
                        });
                    });
                },


                // 是否安装微信
                isInstallWXApp: function isInstallWXApp(options) {
                    var _this = this;

                    options = options || {};
                    return new _promise2.default(function(resolve, reject) {
                        tools.isInstallWXApp(function(resData) {
                            if ((0, _isFunction2.default)(options.callback)) {
                                options.callback.call(_this);
                            }
                            if (resData && resData.resCode == 0) {
                                resolve(resData);
                            } else {
                                reject(resData);
                            }
                        });
                    });
                },


                // 获取 cid
                getCid: function getCid(options) {
                    var _this2 = this;

                    options = options || {};
                    return new _promise2.default(function(resolve, reject) {
                        tools.getCid(function(resData) {
                            if ((0, _isFunction2.default)(options.callback)) {
                                options.callback.call(_this2);
                            }
                            if (resData && resData.resCode == 0) {
                                resolve(resData);
                            } else {
                                reject(resData);
                            }
                        });
                    });
                },


                // 复制内容到剪切板
                copyString: function copyString(string, callback) {
                    var _this3 = this;

                    return new _promise2.default(function(resolve, reject) {
                        tools.copyString(string, function(resData) {
                            if ((0, _isFunction2.default)(callback)) {
                                callback.call(_this3);
                            }
                            if (resData && resData.resCode == 0) {
                                resolve(resData);
                            } else {
                                reject(resData);
                            }
                        });
                    });
                }
            };
        };

        Vue.use(Tools);

        /***/
    })
    /******/
]);