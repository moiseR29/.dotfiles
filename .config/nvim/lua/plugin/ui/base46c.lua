local present, base46 = pcall(require, "base46")

if not present then
  return
end

base46.load_theme()
