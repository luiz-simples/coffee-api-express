exports.ObjectBase =
  setUp: (callback) ->
    @oneHit = 1
    @objectBase = new ObjectBase()
    callback()
    return

  "Should be type Object and ObjectBase": (test) ->
    twoHits = 2

    test.expect twoHits
    test.ok @objectBase instanceof Object
    test.ok @objectBase instanceof ObjectBase
    test.done()
    return

  "Should return the class name 'ObjectBase' when not extend ObjectBase class": (test) ->
    nameObjectBase = "ObjectBase"
    test.expect @oneHit
    test.equal @objectBase.className(), nameObjectBase
    test.done()
    return

  "Should return itself class name when extend ObjectBase class": (test) ->
    nameClassInherited = "ClassInherited"

    ClassInherited = ->
      ObjectBase.apply this, arguments_
      return

    classInherited = new ClassInherited()
    test.expect @oneHit
    test.equal classInherited.className(), nameClassInherited
    test.done()
    return
