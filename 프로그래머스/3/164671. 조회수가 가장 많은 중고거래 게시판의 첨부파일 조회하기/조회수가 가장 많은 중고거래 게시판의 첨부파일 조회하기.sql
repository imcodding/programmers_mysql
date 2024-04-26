SELECT
    CONCAT('/home/grep/src/', 
           b.board_id, '/', file_id, file_name, file_ext
    ) AS file_path
FROM used_goods_board b
LEFT JOIN used_goods_file f USING (board_id)
WHERE b.views = (SELECT MAX(views) FROM used_goods_board)
ORDER BY file_id DESC

