import os

root_dir = "./_dummy/"
for root, dirs, files in os.walk(root_dir):
    print("===================")
    for name in files:
        print(os.path.join(root, name))
    print("----------")
    for name in dirs:
        print(os.path.join(root, name))
