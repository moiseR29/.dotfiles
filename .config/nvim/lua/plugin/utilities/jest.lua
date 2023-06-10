local present, jest = pcall(require, "nvim-jest")

if not present then
  return
end

jest.setup()
