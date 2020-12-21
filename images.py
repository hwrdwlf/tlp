from db import DB

import time
class Images:

    def __init__(self):
        db = DB()
        db.connect()
        self.db = db.cursor
        
    
    def get_image(self, image_id):
        query = '''select images.name, created_at, group_concat(tags.name separator ',') 
                    from images 
                    join image_tags on images.id = image_tags.image_id
                    join tags on tags.id = image_tags.tag_id
                    where images.id = 13; id = %s;'''
        self.db.execute(query, (image_id))
        result = self.db.fetchone()
        if result:
            # formatting for datetime object
            result['created_at'] = time.mktime(result['created_at'].timetuple())
        return result 

    def get_images(self):
        query = '''select images.name, created_at, group_concat(tags.name separator ',') as tags
                    from images 
                    join image_tags on images.id = image_tags.image_id
                    join tags on tags.id = image_tags.tag_id
                    group by images.name, images.created_at;'''
        self.db.execute(query)
        results = self.db.fetchall()
        for result in results:
            unixtime = time.mktime(result['created_at'].timetuple())
            result.update((k, unixtime) for k,v in result.items() if k == 'created_at')
        return results 