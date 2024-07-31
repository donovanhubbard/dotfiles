P = function(v)
  print(vim.inspect(v))
  return v
end

vim.api.nvim_create_user_command("FOO", 'echo "Hello world!"', {bang = true})

