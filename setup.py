from setuptools import find_packages, setup


with open("requirements.txt", "r") as file:
    dependencies = [line.rstrip() for line in file if not line.startswith("#")]

setup(
    name="toy-deployment",
    packages=find_packages(include=["src"]),
    author="Kirill Ivanov",
    version="1.0",
    include_package_data=True,
    install_requires=dependencies
)
