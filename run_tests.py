import subprocess

subprocess.run([
    "robot",
    "--outputdir", "reports",
    "tests/"
])