CKEDITOR.editorConfig = (config) ->
  config.extraPlugins='confighelper'
  config.language = "zh-cn"
  config.uiColor = "#cceaee"
  config.width = '100%'
  config.toolbar = [
    { name: 'basicstyles', items: [ 'Bold','Italic']},
    { name: 'links', items: [ 'Link']},
    { name: 'paragraph', items: [ 'Blockquote']},
    { name: 'styles', items: [ 'Format']}
  ]
  true

