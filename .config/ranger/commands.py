from ranger.api.commands import *

class setwp(Command):
	def execute(self):
		self.fm.execute_console("shell /home/nima/wal.sh "+str(self.fm.thisfile))