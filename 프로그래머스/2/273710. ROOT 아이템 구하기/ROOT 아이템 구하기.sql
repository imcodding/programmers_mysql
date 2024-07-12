SELECT
    i.item_id,
    i.item_name
FROM item_info i
JOIN item_tree t USING (item_id)
WHERE t.parent_item_id IS NULL
