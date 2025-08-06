# Dart doc bug example

This package illustrates a possible bug in Dart doc. It simply declares two Flutter widgets
([`CustomComponent`](lib/src/custom_component.dart) and [`CustomContainer`](lib/src/container.dart))
and re-exports `package:flutter/material.dart`. However, when trying to run `dart doc` in the root,
it does not produce the documentation to any of the specified components and has the following output:

```
Documenting dart_doc_export_material...
Discovering libraries...
[-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------] (100.00%)

Linking elements...
[-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------] (100.00%)

Precaching local docs for 136318 elements...
[-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------] (100.00%)

Initialized dartdoc with 48 libraries
Generating docs for library dart_doc_export_material.dart from file:///Users/pedro.rocha/Work/tmp/dart_doc_test/lib/dart_doc_export_material.dart...
Found 0 warnings and 0 errors.
Documented 1 public library in 10.2 seconds
Success! Docs generated into /Users/pedro.rocha/Work/tmp/dart_doc_test/doc/api
```

If one first runs `flutter pub get`, `dart doc` crashes with the following output:

```
Documenting dart_doc_export_material...
Discovering libraries...
[-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------] (100.00%)

Linking elements...
[-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------] (100.00%)

Precaching local docs for 698713 elements...
[-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------] (100.00%)

Initialized dartdoc with 760 libraries
Generating docs for library dart_doc_export_material.dart from package:dart_doc_export_material/dart_doc_export_material.dart...

dartdoc 8.2.0 (/Users/pedro.rocha/Work/tmp/dart_doc_test/dartdev) failed: UnimplementedError: No members on Library.sentinel are accessible
#0      _LibrarySentinel.noSuchMethod (package:dartdoc/src/model/library.dart:18:7)
#1      _LibrarySentinel.element (package:dartdoc/src/model/library.dart:15:7)
#2      ModelElement._searchForCanonicalLibrary (package:dartdoc/src/model/model_element.dart:538:63)
#3      ModelElement.canonicalLibrary.<anonymous closure> (package:dartdoc/src/model/model_element.dart:518:50)
#4      ModelElement.canonicalLibrary (package:dartdoc/src/model/model_element.dart:533:4)
#5      ModelElement.canonicalLibrary (package:dartdoc/src/model/model_element.dart)
#6      PackageGraph.findCanonicalModelElementFor (package:dartdoc/src/model/package_graph.dart:774:32)
#7      DefinedElementType.isPublic (package:dartdoc/src/element_type.dart:303:22)
#8      IterableOfNameableExtension.wherePublic.<anonymous closure> (package:dartdoc/src/model_utils.dart:86:49)
#9      WhereIterator.moveNext (dart:_internal/iterable.dart:461:13)
#10     MappedIterator.moveNext (dart:_internal/iterable.dart:412:19)
#11     WhereTypeIterator.moveNext (dart:_internal/iterable.dart:892:20)
#12     Constructable.extraReferenceChildren (package:dartdoc/src/model/inheriting_container.dart:35:14)
#13     Container.referenceChildren (package:dartdoc/src/model/container.dart:225:8)
#14     _rejectUnnamedAndShadowingConstructors (package:dartdoc/src/markdown_processor.dart:151:10)
#15     CommentReferable._recurseChildrenAndFilter (package:dartdoc/src/model/comment_referable.dart:159:23)
#16     CommentReferable._lookupViaScope (package:dartdoc/src/model/comment_referable.dart:144:12)
#17     CommentReferable.referenceBy (package:dartdoc/src/model/comment_referable.dart:58:20)
#18     _getMatchingLinkElement (package:dartdoc/src/markdown_processor.dart:176:15)
#19     getMatchingLinkElement (package:dartdoc/src/markdown_processor.dart:187:16)
#20     MarkdownDocument._makeLinkNode (package:dartdoc/src/markdown_processor.dart:313:18)
#21     new MarkdownDocument.withElementLinkResolver.<anonymous closure> (package:dartdoc/src/markdown_processor.dart:267:51)
#22     LinkSyntax._resolveReferenceLink (package:markdown/src/inline_syntaxes/link_syntax.dart:137:36)
#23     LinkSyntax._tryCreateReferenceLink (package:markdown/src/inline_syntaxes/link_syntax.dart:177:18)
#24     LinkSyntax.close (package:markdown/src/inline_syntaxes/link_syntax.dart:103:12)
#25     InlineParser._linkOrImage (package:markdown/src/inline_parser.dart:150:32)
#26     InlineParser.parse (package:markdown/src/inline_parser.dart:106:9)
#27     MarkdownDocument._parseInlineContent (package:dartdoc/src/markdown_processor.dart:298:67)
#28     MarkdownDocument._parseInlineContent (package:dartdoc/src/markdown_processor.dart:303:9)
#29     MarkdownDocument.parseMarkdownText (package:dartdoc/src/markdown_processor.dart:288:5)
#30     Documentation._parseDocumentation (package:dartdoc/src/model/documentation.dart:83:21)
#31     Documentation._renderDocumentation (package:dartdoc/src/model/documentation.dart:64:23)
#32     Documentation.asOneLiner (package:dartdoc/src/model/documentation.dart:58:5)
#33     ModelElement.oneLineDoc (package:dartdoc/src/model/model_element.dart:763:49)
#34     _deduplicated_lib_templates__container_html (package:dartdoc/src/generator/templates.aot_renderers_for_html.dart:3471:25)
#35     _renderLibrary_partial_container_5 (package:dartdoc/src/generator/templates.aot_renderers_for_html.dart:2670:5)
#36     renderLibrary (package:dartdoc/src/generator/templates.aot_renderers_for_html.dart:951:20)
#37     HtmlAotTemplates.renderLibrary (package:dartdoc/src/generator/templates.dart:175:30)
#38     GeneratorBackend.generateLibrary (package:dartdoc/src/generator/generator_backend.dart:185:29)
#39     HtmlGeneratorBackend.generateLibrary (package:dartdoc/src/generator/html_generator.dart:80:11)
#40     GeneratorFrontEnd._generateDocs (package:dartdoc/src/generator/generator_frontend.dart:158:27)
#41     GeneratorFrontEnd.generate (package:dartdoc/src/generator/generator_frontend.dart:37:25)
<asynchronous suspension>
#42     Dartdoc.generateDocsBase (package:dartdoc/src/dartdoc.dart:203:5)
<asynchronous suspension>
#43     Dartdoc.generateDocs (package:dartdoc/src/dartdoc.dart:241:24)
<asynchronous suspension>
#44     Dartdoc.executeGuarded.<anonymous closure> (package:dartdoc/src/dartdoc.dart:273:9)
<asynchronous suspension>
```
