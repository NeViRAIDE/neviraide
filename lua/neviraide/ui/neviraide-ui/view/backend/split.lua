---@param opts? NeviraideUIViewOptions
return function(opts)
  opts.type = 'split'
  return require('neviraide.ui.neviraide-ui.view.nui')(opts)
end
