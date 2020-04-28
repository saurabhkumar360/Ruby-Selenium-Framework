require 'csv'
$table

def openCsvFile(file)
$table =CSV.read(file,headers: true)
end

def readCompleteCol(index)
 return $table.by_col[index]
end

def readCompleteRow(index)
return $table.by_row[index]
end

def readValue(index,header)
	return $table[index][header]
end

def readCell(row,col)
	return $table[row][col]
end