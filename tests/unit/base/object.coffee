exports.ObjectBase =
  "Should be type Object and ObjectBase": (test) ->
    twoHits = 2
    oneHit = 1
    objectBase = new ObjectBase()

    test.expect twoHits
    test.ok objectBase instanceof Object
    test.ok objectBase instanceof ObjectBase
    test.done()
    return

  "Should return the class name 'ObjectBase' when not extend ObjectBase class": (test) ->
    oneHit = 1
    objectBase = new ObjectBase()

    nameObjectBase = "ObjectBase"
    test.expect oneHit
    test.equal objectBase.className(), nameObjectBase
    test.done()
    return

  "Should return itself class name when extend ObjectBase class": (test) ->
    nameClassInherited = "ClassInherited"
  setUp: () ->
    oneHit = 1

    ClassInherited = ->
      ObjectBase.apply this, arguments_
      return

    classInherited = new ClassInherited()
    test.expect oneHit
    test.equal classInherited.className(), nameClassInherited
    test.done()
    return
