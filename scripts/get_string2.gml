///get_string2(str,def)

nn=instance_create(0,0,obj_getString)
nn.Question=argument[0]
nn.searchStr=argument[1]

global.AnsweredQuestion=false
global.MyQuestion=argument[0]
global.AnsweredQuestionResultStr=""